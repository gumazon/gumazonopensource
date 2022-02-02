from pathlib import Path


class Application:
    """Index Scripts.

    """
    __baseurl__ = 'https://github.com/gumazon/gumazonopensource/blob/main/commons'

    def index(self):
        _output = ['# gumazonopensource', 'Common Scripts:']
        _dir = Path(__file__).parent.parent.joinpath('commons')
        for f in _dir.iterdir():
            if f != __file__:
                _output.append('- ['+f.stem+']('+self.__baseurl__+'/'+f.name+')')

        print('output', _output)
        with open(str(Path(__file__).parent.parent.joinpath('README.md')), 'w') as outfl:
            try:
                outfl.write('\n\n'.join(_output))
            except Exception as e:
                print(e)
