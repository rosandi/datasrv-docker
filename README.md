# BASIC DATABASE SERVER

This image contains a basic database server using MYSQL database with httpd web
server. The database can be managed using phpmyadmin.

## Runing the image

docker run  -d --rm --name web01 --hostname web01 \
   -e MYUSER=mymaster -e MYPASS=letmebe rosandi/datasrv

The username of the data administrator is defined by MYUSER and MYPASS
environment. If not provided the default will be used. The user and password
configuration will be printed on screen (use -ti option).

## Environment variables

| variable   | default    | meaning                                    |
|:-----------|:-----------|:-------------------------------------------|
| MYUSER     | datamaster | mysql user name                            |
| MYPASS     | W3LxUqfeqm | mysql user password                        |
| HTTPPORT   | 80         | httpd port                                 |
| INITIALIZE | yes        | do initialization on running the container |

## External files/packages

Fetch phpmyadmin:
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.xz

and synchronize the name inside the Dockerfile

