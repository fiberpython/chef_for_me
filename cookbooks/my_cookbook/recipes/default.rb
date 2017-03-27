#
# Cookbook Name:: my_cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
# make sure my home bin is there else create it.
#

directory "/home/pault/mybin" do
  owner 'pault'
  group 'pault'
  mode '0755'
  action :create
end
 
# here is a list of files that I need to be
# in mybin directory on all of my nodes
#

%w{l myip kk exe t k pidof_list faxw pup1 ksize}.each do |exefile|
   cookbook_file "/home/pault/mybin/#{exefile}" do
     source "#{exefile}"
     owner 'pault'
     group 'pault'
     mode '0755'
   end
end
   
