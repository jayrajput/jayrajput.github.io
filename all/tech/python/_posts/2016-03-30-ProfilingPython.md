---
title: Profiling python code
---

Python amazes me all the time. It is super easy to profile your code in python


To profile your function, wrap it in a call to cProfile

```
import cProfile
(x, y, n) = (1, 14, 25)
cProfile.run('fastAnswer(x, y, n)')
```

Here is the output on the command prompt

```
[foobar]$time python line_up_the_captives.py 
         34462154 function calls (33404007 primitive calls) in 10.606 seconds

   Ordered by: standard name

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000   10.606   10.606 <string>:1(<module>)
  3201575    1.621    0.000    2.536    0.000 line_up_the_captives.py:62(nCr)
  3201575    1.384    0.000    4.225    0.000 line_up_the_captives.py:67(getNumCombinationsForPlacingRItemsInNSlots)
1058148/1    4.569    0.000   10.606   10.606 line_up_the_captives.py:71(fastAnswer)
  4115018    0.242    0.000    0.242    0.000 {len}
 14949728    1.448    0.000    1.448    0.000 {math.factorial}
  1058148    0.130    0.000    0.130    0.000 {max}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
  1058148    0.143    0.000    0.143    0.000 {min}
  5819812    1.069    0.000    1.069    0.000 {range}



real    0m10.641s
user    0m10.620s
sys     0m0.008s
```
