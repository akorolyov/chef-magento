#
# Cookbook Name:: magento
# Recipe:: nginx
#
# Copyright 2015, MavenEcommerce Inc
#
# All rights reserved - Do Not Redistribute
#

include_recipe "nginx"

template File.join(node[:nginx][:dir], 'sites-available', node[:magento][:application][:name]) do
    source 'nginx-site.erb'
    owner 'root'
    group 'root'
    mode 0644
end
nginx_site node[:magento][:application][:name] do
	template nil
    notifies :reload, resources(service: 'nginx')
end