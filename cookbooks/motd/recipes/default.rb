#
# Cookbook Name:: motd
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/etc/motd" do
  mode "0744"
end

# template "/etc/motd.tail" do
#   source "motd.tail.erb"
#   mode "0644"
# end
