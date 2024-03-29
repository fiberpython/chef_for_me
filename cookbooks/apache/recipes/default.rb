#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "httpd" do 
	action :install
	
end


template "/var/www/html/index.html" do
	source "index.html.erb"	
end

execute "mv /etc/httpd/conf.d/welcome.conf{,.disabled}" do
	only_if do
		File.exist?("/etc/httpd/conf.d/welcome.conf")
	end
	notifies :restart, "service[httpd]"
end

node["apache"]["sites"].each do |site_name, site_data|
	document_root = "/srv/apache/#{site_name}"

	template "/etc/httpd/conf.d/#{site_name}.conf" do
		source "custom.erb"
		mode "0644"
		variables(:document_root => document_root,:port => site_data["port"])
		notifies :restart, "service[httpd]"
	end

	directory document_root do
		mode "0755"
		action :create
		recursive true
	end

	template "#{document_root}/index.html" do
		source "index.html.erb"  # don't get this one yet
		mode "0644"
		variables( 
			:site_name => site_name,
			:port 	   => site_data["port"]
			)
		notifies :restart, "service[httpd]"

	end

end


service "httpd" do
	action [ :start, :enable ]
end
