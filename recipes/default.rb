#
# Cookbook Name:: magento
# Recipe:: default
#
# Copyright 2015, MavenEcommerce Inc
#
# All rights reserved - Do Not Redistribute
#

include_recipe "php"
include_recipe "php_pear"


package 'php' do
  action :install
end

# install the mongodb pecl
php_pear "mongo" do
  action :install
end

# install the xdebug pecl
php_pear "xdebug" do
  # Specify that xdebug.so must be loaded as a zend extension
  zend_extensions ['xdebug.so']
  action :install
end

# install apc pecl with directives
php_pear "apc" do
  action :install
  directives(:shm_size => 128, :enable_cli => 1)
end

# Install a FPM pool named "default"
php_fpm_pool "default" do
  action :install
end

service 'php-fpm' do
  action [ :enable, :start ]
end