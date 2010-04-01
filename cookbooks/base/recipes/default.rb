#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2010, jbbarth's personal cookbooks
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

list = %w(zsh screen vim openssh-server git-core subversion make sysv-rc-conf nfs-common tree
          ruby1.8 ruby1.8-dev ri1.8 rake irb rubygems1.8 libopenssl-ruby libsqlite3-ruby1.8
          sqlite3 sysv-rc-conf sysklogd libxslt1.1 libxslt1-dev gawk ncurses-term cryptsetup)
list += %w(mplayer gstreamer0.10-ffmpeg gstreamer0.10-plugins-bad gstreamer0.10-plugins-ugly
          ttf-mscorefonts-installer ttf-liberation ttf-dejavu libgsf-bin imagemagick mplayerthumbs 
          xul-ext-firebug xchm wicd w32codecs irssi conky colordiff p7zip) if node[:domain] == "home"

execute "apt-get update"

list.each do |pkg|
  package pkg
end
