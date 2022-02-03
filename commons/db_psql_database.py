from sqlalchemy import MetaData, Table, Column, String, Integer
from sqlalchemy.orm import Session
from sqlalchemy.ext.declarative import declarative_base
import sqlalchemy as db


class Database:
    """Responsible For Database CRUD.

    These are the steps:
        1. We need to create our session in order to be able to add and commit.
        2. Using our session we use the method .add(customer) passing our customer so this session now what we want to persist, and this model needs to inherit from Base.
        3. And at the end, we need to “commit” our transaction so it’s persisted in our database.
    """
    # replace the user, password, hostname and database according to your configuration according to your information
    engine = db.create_engine('postgresql://user:password@hostname/database_name')

    def __init__(self):
        self.connection = self.engine.connect()
        print("DB Instance created")

    def save(self, model, **kwargs):
        """

        These are the steps:
            1 - We need to create our session in order to be able to add and commit.
            2 - Using our session we use the method .add(customer) passing our customer so this session now what we want to persist, and this model needs to inherit from Base.
            3 - And at the end, we need to “commit” our transaction so it’s persisted in our database.

        :param model:
        :return:
        """
        session = Session(bind=self.connection)
        session.add(model(**kwargs.copy()))
        session.commit()

    def show(self, model, instance_id):
        session = Session(bind=self.connection)
        return session.query(model).filter(model.id == instance_id).first()

    def index(self, model):
        """Index Instances.

        Steps:
            1 — Here we have to use a session, the reason for this is that connection kind creates a direct connection to the database, but in order to have this “wrapper” that will “translate” our table into an object we need a session for this, so we “bind” our already created connection into a session.
            2 — We easily query using our session, the query object has several methods, here we will use all() to get all our customers.

        :param model:
        :return:
        """
        # bind an individual Session to the connection
        session = Session(bind=self.connection)
        return session.query(model).all()

    def search(self, model, **criterion):
        session = Session(bind=self.connection)
        return session.query(model).filterBy(**criterion.copy()).all()

    def update(self, model, instance_id, **kwargs):
        """Update Instance.

        Step by step:
            1 — We have in our constructor the customerName that we are expecting, it's supposed to be string, here we are not doing validations about the type, next one is the address that we will update, as soon we match the user we will update using this parameter.
            2 — Create the data to be updated and set to a variable, to be easier to handle and be more readable, it’s a dictionary that we need to pass the “key” that in this scenario is Customer.address and the value that is the address parameter.
            3 — We are using a query object to look for our Customer, we will filter by our customerName the parameter that we are passing.
            4 — It’s the update object using update(dataToUpdate), I prefer to separate, first we filter and find the user, and set it to a variable after we call the update method and pass the data that we want to update, but all could have been done in the same query.
            5 — In the end, it’s just called our commit() method in order to “publish” this change, and this is it.

        :param model:
        :param instance_id:
        :return:
        """
        session = Session(bind=self.connection)
        data_to_update = {}
        data_to_update.update(**vars(model))

        for k in kwargs.keys():
            if k not in data_to_update.keys():
                raise KeyError(k+' not a valid attribute of '+model.__name__)

        data_to_update.update(**kwargs.copy())

        instance = session.query(model).filter(model.id == instance_id)
        instance.update(model(**data_to_update.copy()))
        session.commit()

    def delete(self, model, instance_id):
        """Delete Instance.

        From everything that you have learned you can see how simple it’s right? Let’s dig a little about:
            1 — In the scenario the parameter customer I'm passing the name of the customer, so I handle it as a string.
            2 — We first fetch the user data, now that we have the object that we map our data we do multiple things:
            1 — We ask for query(Customer);
            2 — We filter using the customer name, using filter(Customer.Name==customer);
            3 — We ask for the first() data, this because this query return actually a statement, try print to see what get back without first() option;
            3 — After retrieving the right data, we call the session.delete(customerData) and ask for the deletion.
            4 — Finally we commit the transaction.

        :param model:
        :param instance_id:
        :return:
        """
        session = Session(bind=self.connection)
        instance = session.query(model).filter(model.id == instance_id).first()
        session.delete(instance)
        session.commit()


Base = declarative_base()


class Contact(Base):
    """Model for customer account."""
    __tablename__ = 'customer'
    name = Column(String)
    age = Column(Integer)
    email = Column(String)
    address = Column(String)
    zip_code = Column(String)
    id = Column(Integer, primary_key=True)

    def __repr__(self):
        return "<Customer(name='%s', age='%s', email='%s', address='%s', zip code='%s')>" % (self.name, self.age, self.email, self.address, self.zip_code)
