from pathlib import Path

import json


def folder(dirname: str):
    _dir = Path(dirname)
    if not _dir.exists():
        _dir.mkdir(0o755)
    return str(dirname)


def load_index(baseurl, exclude, outdir, indir, name='gumazon'):
    """Rebuild App Index.

    :return: README.md file with the new content.
    """
    _app_index = {}
    
    # create static root folder for app:
    _static_root_dir = folder(str(Path(outdir).joinpath(name)))
    _static_root_assets_dir = folder(str(Path(_static_root_dir).joinpath('assets')))

    for dr in Path(indir).iterdir():
        if dr.is_dir():
            if dr.name not in exclude:
                # create resource dir and index page via the resource controller!
                # _static_resource_dir = folder(str(Path(_static_root_dir).joinpath(dr.name)))
                # then ...
                # add resource url to app index
                _app_index[dr.name] = '/'.join([baseurl, dr.name])

    _output = {'title': "Gumazon", 'index': _app_index}
    with open(str(Path(_static_root_assets_dir).joinpath(name+'.json')), 'w') as outfl:
        try:
            outfl.write(json.dumps(_output, indent=4))
        except Exception as e:
            print(e)
