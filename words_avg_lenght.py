#!/usr/bin/python
import sys

TAB_CHAR = '\t'

for line in sys.stdin:
    for token in line.strip().split(" "):
         if token:
            print('word' + TAB_CHAR + str(len(token)))

                