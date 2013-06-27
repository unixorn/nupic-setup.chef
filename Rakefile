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

if File.executable?('/usr/bin/vagrant')
  VAGRANT='/usr/bin/vagrant'
else
  VAGRANT='vagrant'
end

task :help do
  puts "rake box: download nupic.box"
  puts "rake buildbox"
end

desc "Destroy running VM"
task :destroy_vm do
  sh %{#{VAGRANT} destroy -f } do |ok, result|
    # empty block to ignore the exit status of vagrant destroy, so rake won't
    # fail when the VM wasn't running.
  end
end

desc "Vagrant up"
task :vagrant_up do
  sh %{time #{VAGRANT} up }
end

desc "Export vagrant VM to nupic.box"
task :package_box => [ :prep_vm_for_packaging ] do
  sh %{time #{VAGRANT} package --output nupic.box }
end

task :vm_cleanup_yum do
  puts "Cleaning yum in vm..."
  sh %{#{VAGRANT} ssh -c 'sudo yum -y clean all' } do |ok, result|
    # Ignore errors
  end
end

# Copied from bento's minimize.sh
task :vm_minimize => [ :purge_logs_from_vm, :vm_cleanup_yum ] do
  puts "Zero out free space to minimize size of generated box file"
  puts "It is normal to see an error about no space left on device"
  sh %{#{VAGRANT} ssh -c 'sudo dd if=/dev/zero of=/EMPTY bs=1M' } do |ok, result|
    # Ignore errors
  end
  sh %{#{VAGRANT} ssh -c 'sudo rm -f /EMPTY' }
end

task :purge_logs_from_vm do
  puts "Purging log files on vm..."
  sh %{#{VAGRANT} ssh -c 'sudo rm -fv /home/vagrant/*.log' } do |ok, result|
    # Ignore error if there are no log files in /opt/numenta/rpms
  end
end

desc "Prepare VM for packaging"
task :prep_vm_for_packaging => [ :purge_logs_from_vm, :vm_cleanup_yum, :vm_minimize ] do
  puts "Prepping VM for packaging..."
  %w[ /home/vagrant/.bash_history /home/vagrant/.zsh_history /var/log/dmesg.old /etc/profile.d/proxy.sh ].each do |garbage_file|
    puts "purging #{garbage_file}..."
    sh %{#{VAGRANT} ssh -c 'sudo rm -fv #{garbage_file}' } do |ok, result|
      # Use empty block so we ignore error if garbage_file already doesn't exist
    end
  end
end

desc "Build a nupic vagrant base box from scratch. Will destroy your running VM!"
task :base_box => [ :destroy_vm, :vagrant_up, :package_box ]

desc "test cookbook by bringing up a base box from scratch"
task :test => [ :destroy_vm, :vagrant_up ]
