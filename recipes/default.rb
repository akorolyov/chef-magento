#
# Cookbook Name:: magento
# Recipe:: default
#
# Copyright 2015, MavenEcommerce Inc
#
# All rights reserved - Do Not Redistribute
#


include_recipe 'magento::php'
include_recipe 'magento::mysql'
include_recipe 'magento::nginx'

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