---
title: Operating on Files in Bash Efficiently
---

Find files matching a pattern

```
find -name <pattern>

Example:

find -name \*php
```

Find files matching a pattern and containing a text

```
find -name <pattern> | xargs grep -i <texPattern>

Example:

find -name \*php | xargs grep -i myFunction
```

Perform an action on files matching a pattern

```
find -name <pattern> | xargs -n1 <command>

Example:

# Checkout all the files matching a pattern
find -name \*php | xargs -n1 cleartool co -nc

# Move all the file to a folder called backup
find -name \*php | xargs -I{} -n1 mv {} $BACKUPFOLDER
```

# Helpful aliases

```
ff="find -iname "
cc="cleartool co -c "
backup="cp $1 $BACKUP"
```
