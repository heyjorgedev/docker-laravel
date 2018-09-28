# Laravel with Docker
This image is a extension of the official laravel/laravel github repository but with the docker machine environment.

## Usage

### First Time Install
```bash
# This will setup file permissions for project
$ sh bin/init.sh

# Installs a new Laravel Instance
$ sh bin/install.sh

# Next we create the docker containers,
# run composer and the default migrations 
$ bin/setup.sh
```

### Daily Usage
If you inspect the bin/ folder you'll find some scripts for the daily usage of the docker containers to interact with the project.
```bash
# Start Docker Containers
$ bin/start.sh

# Stop Docker Containers
$ bin/stop.sh

# Run Composer
$ bin/composer.sh

# Run Artisan
$ bin/artisan.sh

# Run PhpUnit
$ bin/phpunit.sh

# Run Yarn
$ bin/yarn.sh

# Access the Container Shell
$ bin/cli.sh
```