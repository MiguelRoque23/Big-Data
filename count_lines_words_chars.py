#!/usr/bin/python
import sys

TAB_CHAR = '\t'

for line in sys.stdin:
    print("line" + TAB_CHAR + '1')
    for token in line.strip().split(" "):
        if token: 
            print("word" + TAB_CHAR + '1')
            for token3 in token:
                if token3:
                    print('characters' + TAB_CHAR + '1')
