# Cookbook Name:: nupic
# Recipe:: set_attributes
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
# Set node attribute values.

if node.virtualization.attribute?('system')
    node.default.nupic.tags.vagrant = true if node.virtualization.system == 'vbox'
    node.default.nupic.instance.vagrant = true if node.virtualization.system == 'vbox'
end
