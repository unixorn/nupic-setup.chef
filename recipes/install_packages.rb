# Cookbook Name:: nupic
# Recipe:: install_packages
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
#
# Install packages and versions specified in node attributes.
#
# Disable yum updates; the yum update job running has blocked our installation of packages in the
# past.
service 'yum-updatesd' do
  retries 10
  retry_delay 5
  ignore_failure true
  action [ :stop, :disable ]
end

# Install system packages first, so that if there are any system dependencies in gems,
# they will be satisfied.
node.nupic.packages.system.nucleus.each do |package_name, package_version|
  yum_package package_name do
    version package_version
    retries 5
    retry_delay 5
    allow_downgrade true
    action :install
  end
end

node.nupic.packages.ruby.nucleus.each do |package_name, package_version|
  gem_package package_name do
    version package_version
    retries 5
    retry_delay 5
    action :install
  end
end
