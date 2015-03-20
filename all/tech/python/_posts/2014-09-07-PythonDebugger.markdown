---
layout: post
title:  Python Debugger
date:   2014-08-22
---

Python Debugger can be invoked using Python pdb module

```python
import pdb
pdb.set_trace()
```

set_trace is equivalent to setting a breakpoint. 

# Debugger Commands:
<pre>
n: next
s: step
c: continue up to the next breakpoint
r: run ie. crash
l: list the current code.
q: quit
p: print
ENTER: repeat the last command.
</pre>

See [DebuggingInPython](http://pythonconquerstheuniverse.wordpress.com/2009/09/10/debugging-in-python/) for more information.
