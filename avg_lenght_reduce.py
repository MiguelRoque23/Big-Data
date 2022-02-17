#!/usr/bin/python
import sys


TAB_CHAR = '\t'

lastKey = None
sum = 0
count = 0
for line in sys.stdin:
    key, value = line.strip().split(TAB_CHAR)

    if lastKey and lastKey != key:
        print(lastKey + TAB_CHAR + str(sum))
        lastKey = key
        sum = int(value)
        count += 1
        
    else:
        lastKey = key
        sum += int(value)
        count += 1

if lastKey:
    print('word' + TAB_CHAR + str(sum/count))
