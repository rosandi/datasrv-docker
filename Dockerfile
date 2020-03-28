FROM debian

WORKDIR /root

ENV INITIALIZE=yes
ENV HTTPPORT=80
ENV MYUSER=datamaster
ENV MYPASS=W3LxUqfeqm

RUN apt-get update
RUN apt-get --quiet --yes install systemd
RUN apt-get install --quiet --yes joe lynx rsync
RUN apt-get install --quiet --yes apache2 libapache2-mod-php7.3 
RUN apt-get install --quiet --yes php7.3-mbstring
RUN echo 'mysql-server mysql-server/root_password password W3LxUqfeqm' | debconf-set-selections
RUN echo 'mysql-server mysql-server/root_password_again password W3LxUqfeqm' | debconf-set-selections
RUN apt-get install --quiet --yes default-mysql-server php-mysql
RUN apt-get install --quiet --yes unzip
RUN apt-get clean
COPY tapache2.conf .
COPY phpMyAdmin-5.0.2-all-languages.zip .
RUN unzip phpMyAdmin-5.0.2-all-languages.zip
RUN mv phpMyAdmin-5.0.2-all-languages /var/www/phpmyadmin
COPY config.inc.php /var/www/phpmyadmin
COPY index.html /var/www/html
RUN chown -R www-data.www-data /var/www/phpmyadmin
RUN rm -rf phpMyAdmin-5.0.2-all-languages.zip /var/lib/mysql/*
COPY startserviceandwait .

CMD ./startserviceandwait
