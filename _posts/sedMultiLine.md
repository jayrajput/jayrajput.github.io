Date: 2014-01-13
Title: Sed Trick - Search across multiple lines.

You need to know about the
[Sed-Basics](http://scriptogr.am/jayrajput/post/sed-in-5-minutes) to understand
this one.

Once you have done the substitution/deletion in sed and understood the
Pattern-Space and Hold-Space concepts and the multi-line (N, D, P) command
concepts, the next level is searching in multiple lines.

Multi-line pattern can be divided into two category:

First Category: You know the number of lines in the pattern.  For example: pattern - "@STARTOFPAT.*ENDOFPAT@" is spanning across two lines.

        This is line one with @STARTOFPAT
        The second line contains the remaining pattern.ENDOFPAT@.

Second Category: You do not know how many lines are in the pattern. Example:

        This is line one with @STARTOFPAT
        Unknown number of more lines in between.
        Unknown number of more lines in between.
        Unknown number of more lines in between.
        This line contains the remaining pattern.ENDOFPAT@.

For demo, The intent is to replace the pattern "@STARTOFPAT.*ENDOFPAT@" with "@FINALPAT@" in the two examples.

For #1, when the lines spanned by the input pattern is known then we can just use the N command.

    /@STARTOFPAT/{
        N
        s/@STARTOFPAT.*ENDOFPAT/@FINALPAT@/g
        p
    }

Explanation
------------

    * /@STARTOFPAT/ - Operate on lines containing this pattern
    * N             - Append the next line of input to the pattern space
    * s///          - Substitute.

For #2, when the lines are unknown, we need to use the hold-space:

    /@STARTOFPAT/,/ENDOFPAT@/{
      H
      /ENDOFPAT@/ {
          x
          s/@STARTOFPAT.*ENDOFPAT@/@FINALPAT@/g
          p
      }
    }

Explanation:
------------

    * /@STARTOFPAT/,/ENDOFPAT@/{ - Operate on lines in this range.
    * H                          - Append input line to the hold space. This is the way to collect all the lines.
    * /ENDOFPAT@/ {              - Operate only for last line in the range.
    * x                          - Exchange Pattern-Space with Hold-Space.
    * s///g                      - Substitute
    * p                          - Print the pattern space

Notes
-----
* Use sed with -n option to not print by default.
* Send me a mail at jayrajput@gmail.com if you have questions/comments.
