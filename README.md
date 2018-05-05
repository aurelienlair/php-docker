## Description
Base PHP Docker project with [PHPUnit](https://phpunit.de/) testing framework.
The project runs within a Docker container and should work only from the command line.
The first boot takes a couple of minutes (due to all the dependencies to be installed)
but then is very quick.

## Installation

```
$ cd /home/aurelien/my-projects/
```

Clone the repository:

```
$ /usr/bin/git clone git@github.org:aurelienlair/php-docker.git 
$ cd php-docker
``` 

Build the image and create the container:

```
$ /snap/bin/docker build --rm -t php-docker-image:latest .
```

Run a bash session within the container called php-docker-container then run PHPunit:

```
$ /snap/sbin/docker run -it --rm --name php-docker-container php-docker-image:latest bash -l
$ phpunit
```

Note:
If you want to copy files from the source project (outside of the container) into
the container or vice versa (from the container to the host root project), I have
created 2 aliases from the container on purpose (see bash-tools file).
The only thing you will need to do is to mount your volume (source directory) into 
the Docker container:
```
$ /snap/sbin/docker run -it -v /home/aurelien/my-projects/php-docker:/usr/src/php-docker-src \
    --rm --name php-docker-container \
    php-docker-image:latest \
    bash -l
```
## Requires
[Docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/) 

[Git](https://git-scm.com/) 
