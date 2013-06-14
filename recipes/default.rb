# Cookbook Name:: nupic
# Recipe:: default
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

# We install our packages prior to including recipes to deal with any
# dependency issues.

include_recipe 'nupic::configure_yum_repos'
include_recipe 'nupic::install_packages'
include_recipe 'nupic::include_base_recipes'
include_recipe 'nupic::set_attributes'
include_recipe 'nupic::configure_services'
include_recipe 'nupic::configure_directories'
include_recipe 'nupic::configure_files'
