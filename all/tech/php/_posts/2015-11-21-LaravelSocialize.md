---
title: Laravel Socialize
---

Laravel has a plugin called socialize which will let you use OAuth.

Follow the steps here with some changes:

    http://tutsnare.com/social-authentication-in-laravel-5/

The composer update needs to be done before updating the config/app.php

When updating config/app.php, aliases can be

    'Socialize' => Laravel\Socialite\Facades\Socialite::class,

Providers can be

    Laravel\Socialite\SocialiteServiceProvider::class,

Using ::class is more maintainable then using the strings.

Follow the steps documented here for setting up OAuth credentials.

    https://goldplugins.com/documentation/wp-social-pro-documentation/how-to-get-an-app-id-and-secret-key-from-facebook/
