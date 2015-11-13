# Oberd Webapp Docker Container

This container is a good starting point if you want to create a [PHP](https://www.php.net) web application using [apache](http://apache.org/) as the webserver. The image is built ontop of [Alpine Linux](http://www.alpinelinux.org/) which is a lightweight, security oriented Linux distro.

## What's Included

The container is meant to be small and lightweight, so in turn is fairly minimal by design. However, the container should have everything contained that you would need to create a project that is PHP based and served by Apache.

### Installed PHP Modules

    PHP 5.6.14
    JSON
    GD
    Common
    SOAP
    MCrypt
    PDO
    MySQLi
    XML
    CURL
    Phar
    Pear
    Cli
    OpenSSL


### Installed Apache Modules


    Apache 2.4.16
    SSL
    Proxy
    
## Working With the Image

While you're highly unlikely to use this image as you entire container, and are more likely to use this as your base image, below are some commands that you can use to 
make additions and changes to the image.

### Typical usage
```Dockerfile
FROM mtahv3/oberd-webapp:0.1
```

### Starting the container

To start the container, you would use the following command

```sh
$ docker run --name app1 -d -P mtahv3/oberd-webapp:0.1
```
### Verify the container is running

```sh
$ docker ps

CONTAINER ID        IMAGE                     COMMAND                  CREATED             STATUS              PORTS                                           NAMES
7a3e6c2cc5a6        mtahv3/oberd-webapp:0.1   "apachectl -D FOREGRO"   4 seconds ago       Up 3 seconds        0.0.0.0:32775->80/tcp, 0.0.0.0:32774->443/tcp   app1
```

### Logging into the container

While the containers should more or less be treated as immutable servers, you can access the container and get a command line with the following command.

```sh
$ docker exec -it app1 sh
```