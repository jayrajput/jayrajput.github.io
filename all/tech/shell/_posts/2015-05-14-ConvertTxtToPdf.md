---
title: Convert Text To Pdf
---

First, get the required tool

     sudo yum install enscript ghostscript

Two step process

    # Use -B for no page header
    enscript -B -p output.ps input.txt
    ps2pdf output.ps output.pdf
