#!/usr/bin/env python3 
import math
for i in range(1000):
    for j in range(1000):
        k = math.sqrt(i*i + j*j)
        if i+j+k==1000 and i*j*k > 0:
            print(str(int(i*j*k)))
            exit()
