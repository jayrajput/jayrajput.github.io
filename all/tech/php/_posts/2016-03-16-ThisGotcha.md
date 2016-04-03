----
title: $this Gotcha
----

PHP provides a pseudo variable $this which is available inside any class method
to access the current object when the class method of called on an object.

But what happens if the method (even though non-static) was called statically?

PHP is forgiving like your parents and will set the $this to the secondary
object from which context this function was called statically.

Let us try to understand this with an example:

```
<?php
// File: /tmp/test.php
class OuterClass
{
    public function outerFunctionNonStaticallyCallingInner()
    {
        $inner = new InnerClass();
        $inner->innerFunction();
    }

    public function outerFunctionStaticallyCallingInner()
    {
        InnerClass::innerFunction();
    }

    public function printMe()
    {
        print __CLASS__ . PHP_EOL;
    }
}

class InnerClass
{
    public function innerFunction()
    {
        $this->printMe();
    }

    public function printMe()
    {
        print __CLASS__ . PHP_EOL;
    }
}

$outerObject = new OuterClass();
// This prints 'InnerClass'
$outerObject->outerFunctionNonStaticallyCallingInner();
// This prints 'OuterClass'
$outerObject->outerFunctionStaticallyCallingInner();
```

Output from our /tmp/test.php class

```
[~]$php /tmp/test.php
InnerClass
OuterClass
```
