Date: 2014-01-12
Title: Vim Append This Line to Next Line

J can be used to append next line to current line.  But there was no easy way
to append current line to next line.


Why will I want to do append this line to next line? I wanted to change the
comments to the end of the line. I was working on assembly code and wanted to
move the comments at the top of the line to the end of the line.

    #call Linux
    int $LINUX_SYSCALL

To

    int $LINUX_SYSCALL #call Linux

No easy way was found but I found a way to make the command repeatable. Drew
Neil in his book "Editing at the speed of thought" stress the idea of composing
your changes as repetable. Vim is optimized for repetition, so we need to be
mindful of how we compose our changes.


Append current line to the next line can be achieved in this way, though this
is not repeatable.

    ddpkJ

Explanation
-----------

* dd - Delete current line
*  p - Paste current line below the now-current line (previous next line)
*  k - Move up one line
*  J - Join this line and next line.


Here is repeatable commands

    dd
    :s/\n/\=@"/

Explanation
-----------
* dd   - Delete current line
* :s   - Substitution on current line
* \n   - Carriage Return on Unix
* \=@" - Content of register "

Repetition is done by:

    dd
    @:

Explanation
-----------
* dd - Delete current line
* @: - Repeat last Ex command (which was substitution in this case)
