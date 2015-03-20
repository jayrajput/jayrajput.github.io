---
layout: post
title:  "Adding Startup Commands to DWM in 2 Steps"
date:   2014-02-28 07:23:59
categories: dwm
---

I use dwm (desktop window manager) tiling manager. I wanted to disable my touch
pad on start up and here I share my experience.  To put synclient command to
startups do these two steps:

Step#1. Create a new file /usr/local/bin/dwm_startup with 755 permissions.

{% highlight bash %}
    root@jay-Inspiron-5521:/usr/local/bin# cat /usr/local/bin/dwm_startup 
    #!/bin/bash
    
    # disable touchpad.
    synclient Touchpadoff=1
    
    exec dwm
{% endhighlight %}

Step#2. Modify /usr/share/xsessions/dwm.desktop to use dwm_startup. Value for Exec

{% highlight bash %}
    root@jay-Inspiron-5521:/usr/local/bin# cat /usr/share/xsessions/dwm.desktop
    [Desktop Entry]
    Encoding=UTF-8
    Name=Dwm
    Comment=Dynamic window manager
    Exec=dwm_startup
    Icon=dwm
    Type=XSession
{% endhighlight %}

You are done!!


