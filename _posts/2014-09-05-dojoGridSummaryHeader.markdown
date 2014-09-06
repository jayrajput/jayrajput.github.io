---
layout: post
title:  Dojo Grid Summary Header
date:   2014-09-5
---

Dojo Grid does not support summary header in the first row. But you can hack
your way around by using onAfterRow function hook. onAfterRow hook is called
after a row is created by Dojox.DataGrid. The dojo DOM modification function
dojo.place can be used to put a summary header as the table first row.

All rows in Dojox.DataGrid are tables. So header will be a table.
