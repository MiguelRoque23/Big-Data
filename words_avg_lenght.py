#!/usr/bin/python
import sys

TAB_CHAR = '\t'

for line in sys.stdin:
    for token in line.strip().split(' '):
         if token:
            print('Number of words:' + TAB_CHAR + str(len(token)))
