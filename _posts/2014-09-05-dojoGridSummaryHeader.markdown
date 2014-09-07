---
layout: post
title:  Dojo Grid Summary Header
date:   2014-09-5
---

Dojo Grid does not support summary header in the first row. But you can hack
your way around by using onAfterRow function hook. onAfterRow hook is called
after a row is created by Dojox.DataGrid. The dojo DOM modification function
dojo.place can be used to put a summary header as the table first row.

All rows in Dojox.DataGrid are tables. So header will be a table. This table
needs to be modified using dojo.place to include more rows.

```
// CSS to hide the first row needed for rendering.
#myGridHeaderFirstRow {
    visibility: hidden;
}

// Dojo grid structure looks like this:
function getStructure() {
    return [{
        onAfterRow: function (inRowIndex) {
            if (inRowIndex < 0) {
                var tbody = dojo.query(".dojoxGridHeader tbody");
                // This is the summary header.
                dojo.place(
                    getSecondRowHtml(),
                    tbody[0], 
                    "first"
                );
                // you also need to put a row so that the table is
                // rendered properly. This is later hidden by using CSS.
                dojo.place(
                    getFirstRowHtml(),
                    tbody[0], 
                    "first"
                );
            }
        },
        cells: [
            ....... // define your cells here.
        ]
    }];
};
function getSecondRowHtml(){
    ......... // return HTML string with apprpriate colspan
}
function getFirstRowHtml() {
    ........ // return HTML string with colspan = 1
}

```
