#
# Cookbook Name:: gitweb
# Recipe:: default
#
# Copyright 2011, Jean-Baptiste Barth
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

apt_package "gitweb"

template "/etc/gitweb.conf" do
  source "gitweb.conf.erb"
  owner  "root"
  group  "root"
  mode   "0644"
end

# fcgiwrap allows us to wrap cgi scripts in fcgi
# so we can run gitweb behing nginx
# see: http://michalbugno.pl/en/blog/gitweb-nginx
apt_package "fcgiwrap"

service "fcgiwrap" do
  supports :status => true, :restart => true, :reload => false
  action [:enable, :start]
end

# nginx vhost configuration
domain = "git.#{node[:domain]}"
template "/etc/nginx/sites-available/#{domain}" do
  source "nginx-vhost.conf.erb"
  variables :domain => domain
end

execute "nxensite #{domain} && /etc/init.d/nginx reload" do
  not_if "test -h /etc/nginx/sites-enabled/#{domain}"
end