#!/usr/bin/env python

__version__ = '0.1.0'
__authon__ = 'Gumshoe Media Inc.'
__email__ = 'admin@gumazon.io'


import json
from pathlib import Path


class RecordJsonFiler:
    """Manage dictionary JSON output-file.

    Example:
        -   name: initialize and save with input-data.
        expected_output:
            file: cwd/data/{__file__.parent.name}.json
            containing: {"uid": 1, "file": "data/gumazon.json", "name": "someOtherFile"}
        actual_input:
            rec = RecordJsonFiler(**{'uid': 1})
            rec.save(**{'name': 'someOtherFile'})
            print(rec.index())

    jobs:
        init:
        save:
        index:
        show:
        update:
        delete:

    """
    def __init__(self, **kwargs):
        """Initialized.

        Example:
        -------
        -   name: initialize record json file, without input-data.

            expected_output:
                file: cwd/data/{__file__.parent.name}.json

                containing: {"uid": 0, "file": "data/gumazon.json"}
            actual_input:
                rec = RecordJsonFiler()

                print(rec.index())

        -   name: initialize record json file, with input-data.

            expected_output:
                file: cwd/data/{__file__.parent.name}.json

                containing: {"uid": 0, "file": "data/gumazon.json"}

            actual_input:
                rec = RecordJsonFiler(**{'uid': 1})

                print(rec.index())

        :param kwargs:
        """
        self._uid = kwargs.get('uid', 0)
        self._file = kwargs.get('file', 'data/{}.json'.format(Path(__file__).parent.name))
        self._index = {}
        self.__load()
        self._index.update({'uid': self._uid, 'file': self._file})
        self._index.update(**kwargs.copy())
        self.__commit()

    def index(self):
        return self._index

    def save(self, **kwargs):
        """Save dictionary into the given file as a JSON.

        -   name: save without input-data.

            expected_output:
                file: cwd/data/{__file__.parent.name}.json

                containing: {"uid": 0, "file": "data/gumazon.json"}
            actual_input:
                rec = RecordJsonFiler()

                rec.save()

                print(rec.index())

        -   name: save with input-data.

            expected_output:
                file: cwd/data/{__file__.parent.name}.json

                containing: {"uid": 0, "file": "data/gumazon.json", "name": "someOtherFile"}
            actual_input:
                rec = RecordJsonFiler()

                rec.save(**{'name': 'someOtherFile'})

                print(rec.index())

        :param kwargs: data to save
        :return:
        """
        for k in kwargs.keys():
            if k not in self._index.keys():
                self._index[k] = kwargs[k]
        self.__commit()
        self.__load()

    def show(self, key):
        if key in self._index.keys():
            return self._index.values()

    def update(self, key, **kwargs):
        if key in self._index.keys():
            self._index.update({key: kwargs.copy()})
        self.__commit()
        self.__load()

    def delete(self, key):
        if key in self._index.keys():
            remaining_dictionary = {}
            for k in self._index.keys():
                if k != key:
                    remaining_dictionary[k] = self._index[k]
                self._index = remaining_dictionary
        self.__commit()
        self.__load()

    def __load(self):
        self._index = {}
        if Path(self._file).exists():
            with open(self._file, 'r') as _in_index_fl:
                self._index.update(json.loads(_in_index_fl.read()))

    def __commit(self):
        with open(self._file, 'w') as _out_index_fl:
            _out_index_fl.write(json.dumps(self._index, indent=4))


if __name__ == '__main__':
    print(Path(__file__).name)
