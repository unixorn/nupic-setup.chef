# Cookbook Name:: nupic
# Recipe:: configure_files
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

# Add a version file so we can tell when a given image was created.
file "/etc/nupic_image_version" do
  owner 'root'
  group 'root'
  mode '0644'
  content node.nupic.version
  action :create
end

# Add our logo to motd. This gives us a quick visual indicator when we log in
# that an instance was setup by the nupic cookbook.
template '/etc/motd' do
  path '/etc/motd'
  source 'motd.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables(
    :image_version  => node.nupic.version
  )
  action :create
end

# Create reasonable default dotfiles
cookbook_file '/etc/skel/.bash_profile' do
  source 'bash_profile_skeleton'
  owner 'root'
  group 'root'
  mode '0644'
end

cookbook_file '/etc/skel/.bashrc' do
  source 'bashrc_skeleton'
  owner 'root'
  group 'root'
  mode '0644'
end

cookbook_file '/etc/skel/.zsh_profile' do
  source 'zsh_profile_skeleton'
  owner 'root'
  group 'root'
  mode '0644'
end

# And give to the vagrant user too
cookbook_file '/home/vagrant/.bash_profile' do
  source 'bash_profile_skeleton'
  owner 'vagrant'
  group 'vagrant'
  mode '0644'
end

cookbook_file '/home/vagrant/.bashrc' do
  source 'bashrc_skeleton'
  owner 'vagrant'
  group 'vagrant'
  mode '0644'
end

cookbook_file '/home/vagrant/.zsh_profile' do
  source 'zsh_profile_skeleton'
  owner 'vagrant'
  group 'root'
  mode '0644'
end
