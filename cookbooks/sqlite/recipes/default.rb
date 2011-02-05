#
# Cookbook Name:: sqlite
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

include_recipe "apt::lenny-backports" if node[:platform] == "debian"

apt_package "sqlite3" do
  if node[:platform] == "debian"
    version "3.7.3-1*"
    options "-t lenny-backports"
  end
end