import sys

TAB_CHAR = '\t'

for line in sys.stdin:
    for token in line.strip().split(" "):
        if token: 
            print(token + TAB_CHAR + '1')
            
for line in sys.stdin:
    words = line.strip().split(" ")
    if len(words) % 2 == 0:
        println('even' + TAB_CHAR + '1')
    else:
        println('odd' + TAB_CHAR + '1')
