#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "apache2" do
  action :install
end

service "apache2" do
  action [ :enable, :start ]
end

node.default["apache2"]["indexfile"] = "index2.html"
cookbook_file "/var/www/html/index.html" do
  source node["apache2"]["indexfile"]
  mode "0644"
end

