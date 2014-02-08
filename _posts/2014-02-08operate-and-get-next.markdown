Date: 2014-01-11
Title: Toggling between two commands on the bash command line (operate-and-get-next).

Ever found yourself switching between two commands on the bash command line.  I
found myself during debugging sessions. I had to toggle between
register/de-register commands. In place of typing them each time, I was using
the bash history command (up-arrow/Ctrl-p) followed by <enter>. This was good
but you had to make sure that you do not hit the Ctrl-p too many times. If you
hit it too many times, you have to hit Ctrl-n.

A better way is to use Ctrl-o (operate and get next). MIT doc
(http://web.mit.edu/gnu/doc/html/features_7.html) specifies this definition.

    operate-and-get-next (C-o)
        Accept the current line for execution and fetch the next line relative to the current line from the history for editing. Any argument is ignored.

Steps to use:

* Get the two commands in the history by executing them once.
* Use C-p to get the last executed command.
* Without hitting <enter>, use C-o to operate and fetch.
* Keep using C-o to toggle.
