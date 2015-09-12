---
title: Laraval DB command
---


To migrate and seed the database


|Command                         | Syntax
|To migrate and seed the database| php artisan migrate:refresh --seed


Disable the CURL CSRF check for the URLS by specifying the except array in the
app/Http/Middleware/VerifyCsrfToken.php

    protected $except = [
        'doctors/*',
    ];

Note that there is no trailing slash in front.
