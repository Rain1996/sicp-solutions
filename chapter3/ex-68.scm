; 这个程序会无限循环下去, 因为(pairs (stream-cdr s) (stream-cdr t))会一直重复调用.
