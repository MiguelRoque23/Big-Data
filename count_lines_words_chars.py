import sys

TAB_CHAR = '\t'

for line in sys.stdin:
    print('Number of lines:' + TAB_CHAR + '1')
    for token in line.strip().split(" "):
        if token: 
            print('Number of words:' + TAB_CHAR + '1')
            for token3 in token:
                if token3:
                    print('Number of characters:' + TAB_CHAR + '1')
