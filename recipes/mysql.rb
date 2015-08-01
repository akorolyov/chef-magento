#
# Cookbook Name:: magento
# Recipe:: mysql
#
# Copyright 2015, MavenEcommerce Inc
#
# All rights reserved - Do Not Redistribute
#

mysql_service 'default' do
  port '3306'
  bind_address '0.0.0.0'
  version '5.6'
  initial_root_password ''
  action [:create, :start]
end

mysql_client 'default' do
  action :create
end