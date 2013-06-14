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

task :help do
  puts "rake box: download nupic.box"
  puts "rake buildbox"
end

desc "Destroy running VM"
task :destroy_vm do
  sh %{vagrant destroy -f } do |ok, result|
    # empty block to ignore the exit status of vagrant destroy, so rake won't
    # fail when the VM wasn't running.
  end
end

desc "Vagrant up"
task :vagrant_up do
  sh %{time vagrant up }
end

desc "Export vagrant VM to nupic.box"
task :package_box do
  sh %{time vagrant package --output nupic.box }
end

desc "Build a nupic vagrant base box from scratch. Will destroy your running VM!"
task :base_box => [ :destroy_vm, :vagrant_up, :package_box] do
end

desc "test cookbook by bringing up a base box from scratch"
task :test => [ :destroy_vm, :vagrant_up ]
