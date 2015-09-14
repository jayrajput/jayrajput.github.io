#!/bin/bash

docker run --rm --label=jekyll --label=stable --volume=$(pwd):/srv/jekyll jekyll/stable jekyll build
