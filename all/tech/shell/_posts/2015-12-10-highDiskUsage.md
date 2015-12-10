---
title: Fix windows 10 high disk usage
---

My system was showing high disk usage. I was able to fix it by following the
steps mentioned in 

    https://www.youtube.com/watch?v=5Mbrw1x0LzU

TLDR version
------------

Disable these three services from services.msc and in the registry.

- BITS (Background Intelligent Task Service). One which downloads the windows update in background
- SuperFetch - This is the one which gives you readyBoost feature.
- WindowsSearch. Disabling this is optional.


HKEY_LOCAL_MACHINE --> SYSTEM --> ControlSet001--> Control --> Session Manager --> Memory Manager --> Prefetch Parameters

Change EnablePrefetcher and EnableSuperfetch from 3 to 1
