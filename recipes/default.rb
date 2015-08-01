#
# Cookbook Name:: magento
# Recipe:: default
#
# Copyright 2015, MavenEcommerce Inc
#
# All rights reserved - Do Not Redistribute
#

include_recipe "php"

# install the mongodb pecl
php_pear "mongo" do
  action :install
end

#install the xdebug pecl
php_pear "xdebug" do
  # Specify that xdebug.so must be loaded as a zend extension
  zend_extensions ['xdebug.so']
  action :install
end

# Install a FPM pool named "default"
php_fpm_pool "default" do
  action :install
end

service 'php5-fpm' do
  action [ :enable, :start ]
end