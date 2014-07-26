---
layout: post
title:  Javascript this keyword and callbacks.
date:   2014-07-25
---

In C++, this keyword always points towards the class or one of the derived
classes. It might be nice to have this point to any class and not just limited
to self and derived classes.

Enter the Javascript and you have apply/call to change this object at run time
without the clutter of creating a derived class.

Before we jump into Function.prototype.apply, let us understand what are the
rules for this keyword.

Javascript can invoke function in four differnt ways:
* Method invocation
* Function invocation
* Apply/Call invocation
* Constructor invocation

The pattern mainly differ in how the this parameter is initialized.  When you
use obj.func(), you would invoke func with the method invocation pattern and
this points to the obj. On the other hand, when a function is not a property of
an object, then is it invoked using function pattern. In this case, this points
to the global object. The function pattern also applies when you are calling
callbacks.

What do you do when you want to control the this for a callback invocation?
You use apply/call invocation.

{% highlight Javascript %}
var myCallbackObj = {
    var myCallbackFunc = function() {
        // callback code doing something with this.
    }
};

myCallbackObj.myCallbackObj.apply(myObj, arguments);
{% endhighlight %}


MDN also gives an example of monkey patching using Javascript apply function.

{% highlight javascript %}
var originalFoo = someobject.foo;
someobject.foo = function () {
    console.log(arguments);
    originalFoo.apply(this, arguments);
}
{% endhighlight %}
