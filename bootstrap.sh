#!/usr/bin/env bash

#yum -y update

echo -e "Let's setup! Installing vim..."
yum -y -d 1 install vim --nogpgcheck

echo -e "Installing httpd + mod_ssl..."
yum -y -d 1 install httpd mod_ssl --nogpgcheck

echo -e "UIS Community - up to date and regularly maintained RPM packages for RHEL"
echo -e "Installing epel-release-6-8.noarch.rpm..."
rpm -Uvh http://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm --quiet --nosignature
echo -e "Installing ius-release-1.0-11.ius.el6.noarch.rpm..."
rpm -Uvh http://dl.iuscommunity.org/pub/ius/stable/Redhat/6/x86_64/ius-release-1.0-11.ius.el6.noarch.rpm --quiet --nosignature

echo -e "Installing Memcached..."
yum -y -d 1 install memcached --errorlevel=0 --nogpgcheck

echo -e "Installing PHP..."
yum -y -d 1 install php53u php53u-common php53u-devel php53u-pear php53u-gd php53u-pecl-memcache php53u-pecl-memcached php53u-pecl-apc php53u-mcrypt php53u-pdo --nogpgcheck

echo -e "Installing GeoIp..."
yum -y -d 1 install php-pecl-geoip --nogpgcheck
echo "extension=geoip.so" > /etc/php.d/geoip.ini
echo "geoip.custom_directory=/usr/share/php/GeoIP" >> /etc/php.d/geoip.ini
mkdir -p /usr/share/php/GeoIP
#wget -q -O /usr/share/php/GeoIP/GeoIP.dat.gz http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
#gzip -q -d /usr/share/php/GeoIP/GeoIP.dat.gz
#chmod 0744 /usr/share/php/GeoIP/GeoIP.dat

echo -e "Configuring..."
alias cp=cp # in redhat cp is aliased to cp -i
cp -f /vagrant/config/httpd/*.conf /etc/httpd/conf.d/
cp -f /vagrant/config/php/*.ini /etc/php.d/
cp -f /vagrant/config/logrotate/* /etc/logrotate.d/

mkdir -p /var/log/gg
chown apache:apache /var/log/gg

ln -s /vagrant/copy/ /vagrant/www/app/locale/en_gb

echo -e "Starting memcached and httpd..."
/etc/init.d/memcached start
/etc/init.d/httpd start

echo -e "Hooray! vg-php-box has been installed successfully!!"
