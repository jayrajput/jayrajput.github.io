---
layout: post
title:  Javascript-Apply
date:   2014-07-25
---


MDN suggest monkey patching using Javascript apply function.

{% highlight javascript %}
var originalFoo = someobject.foo;
someobject.foo = function () {
    console.log(arguments);
    originalFoo.apply(this, arguments);
}
{% endhighlight %}


On the same lines you can create a function which use this, and let the caller
decide the this

{% highlight javascript %}
formatCell = function (val) {
    var valObj = dojo.fromJson(val);
    dojo.forEach(valObj.cssStyles, function(cssStyle) {
        this.customCssStyles.push(cssStyle);
    }, this);
}

cell.formatter = function (val) {
    formatCell.apply(this, arguments);
}

// or use the Function.prototype.bind
cell.formatter = formatcell.bind(this);
{% endhighlight %}
