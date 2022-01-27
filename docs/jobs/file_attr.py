#!/usr/bin/env python

__all__ = ['get']

import sys



def get(file, attr_name):
    _output = ''

    try:
        with open(file, 'r') as infl:
            _lines = infl.readlines()
    except Exception as e:
        print(': '.join([e.args[1], file]))
    else:
        for _line in _lines:
            if attr_name in _line:
                _output = _line.split(' ')[-1]
    finally:
        return _output



if __name__ == '__main__':
    _file = ''
    _attr_name = ''
    
    if len(sys.argv) > 1:
        _file = sys.argv[1]
    
    if len(sys.argv) > 2:
        _attr_name = sys.argv[2]
        
    if not _file:
        print('Missing File Path!')
        return
        
    if not _attr_name:
        print('Missing Attribute Name!')
        return

    print(get(file=_file, attr_name=_attr_name))
    
