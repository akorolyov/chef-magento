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

execute "create #{node[:mysql][:database][:name]} database" do
    command <<-EOH
    /usr/bin/mysqladmin -u root -h 127.0.0.1 create #{node[:mysql][:database][:name]}
    EOH
end

execute "import data for #{node[:mysql][:database][:name]} database" do
    command <<-EOH
    /usr/bin/mysql -u root -h 127.0.0.1 #{node[:mysql][:database][:name]} < #{node[:magento][:application][:directory]}/source/#{node[:mysql][:database][:name]}.sql
    EOH
end