#!/bin/bash
source "/usr/local/rvm/scripts/rvm" || exit 1
cd /var/chef
localrev=$(git rev-parse HEAD)
remoterev=$(git ls-remote origin master|awk '{print $1}')
echo $remoterev
echo $localrev
if [ "$remoterev" != "$localrev" ]; then
  git pull origin master 2>&1 | sed 's/^/COOKBOOKS UPDATE: /'
fi
rvm 1.9.2@chef
chef-solo $* 2>&1|fgrep -v -e "INFO: Processing" -e "INFO: Run List" -e "INFO: Setting the run_list" \
                           -e "Gem::SourceIndex#search"
