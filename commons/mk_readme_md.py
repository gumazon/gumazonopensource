from pathlib import Path

import json


def folder(dirname: str):
    _dir = Path(dirname)
    if not _dir.exists():
        _dir.mkdir(0o755)
    return str(dirname)


def load_readme(baseurl, exclude, outdir, indir, name='gumazon'):
    """Rebuild App Index.

    :return: README.md file with the new content.
    """
    _app_index = {}
    # create static root folder for app:
    _static_root_dir = folder(str(Path(outdir).joinpath(name)))

    for dr in Path(indir).iterdir():
        if dr.is_dir():
            if dr.name not in exclude:
                # create resource dir
                _static_resource_dir = folder(str(Path(outdir).joinpath(name)))
                # add resource url to app index
                _app_index[dr.name] = '/'.join([baseurl, dr.name])

    _output = {'title': "Gumazon", 'index': _app_index}
    with open(str(Path(outdir).joinpath('README.md')), 'w') as outfl:
        try:
            outfl.write('\n\n'.join([_l[0]+': '+_l[1] for _l in _output.items()]))
        except Exception as e:
            print(e)
