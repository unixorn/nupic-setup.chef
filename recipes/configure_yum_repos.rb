# Cookbook Name:: nupic
# Recipe:: configure_yum_repos
#
# Copyright 2013, Numenta Inc.
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

# Enable yum epel repos
cookbook_file '/etc/yum.repos.d/epel.repo' do
  source 'epel.repo'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  # TODO Determine if there is a service we need to notify here.
end

cookbook_file '/etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6' do
  source 'epel.key'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
  # TODO Determine if there is a service we need to notify here.
end

include_recipe 'yum::epel'
