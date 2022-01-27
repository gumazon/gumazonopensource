#!/usr/bin/env python

import runpy


try:
    runpy.run_path(__file__, run_name='__main__')
except SystemExit:
    pass
