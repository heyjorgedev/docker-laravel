#!/usr/bin/env bash

DIR="$(dirname "$0")"

echo "Installing Laravel";

sh $DIR/composer.sh create-project --prefer-dist laravel/laravel .
