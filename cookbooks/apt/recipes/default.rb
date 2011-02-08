#
# Cookbook Name:: apt
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

if node[:platform] == "debian" && node[:platform_version].match(/^5.0/)
  file "/etc/apt/apt.conf.d/20stay-on-lenny" do
    content %(APT::Default-Release "lenny";)
    owner "root"
    group "root"
    mode "644"
  end
end
