# Cookbook Name:: nupic
# Recipe:: attributes::default
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
# Base settings for the Nupic Cookbook.
default.nupic.version = '2013.06.27'

default.nupic.packages.ruby.nucleus = {
    'bunny'        => '0.8.0',
    'fpm'          => '0.4.39',
    'trollop'      => '2.0'
}

# If you want to specify a version, make sure you specify the rev like so:
# 'logrotate' => '3.7.8-15.el6'
case platform
when 'centos'
  default.nupic.packages.system.nucleus = {
    'bind-utils'   => '9.8.2-0.17.rc1.el6_4.4',
    'cronie'       => '1.4.4-7.el6',
    'curl'         => '7.19.7-36.el6_4',
    'dash'         => '0.5.5.1-4.el6',
    'daemonize'    => '1.7.3-1.el6',
    'emacs-nox'    => '23.1-21.el6_2.3',
    'git'          => '1.7.1-3.el6_4.1',
    'htop'         => '1.0.1-2.el6',
    'iotop'        => '0.3.2-3.el6',
    'logrotate'    => '3.7.8-16.el6',
    'lsof'         => '4.82-4.el6',
    'man'          => '1.6f-32.el6',
    'mysql'        => '5.1.69-1.el6_4',
    'mysql-server' => '5.1.69-1.el6_4',
    'mysql-devel'  => '5.1.69-1.el6_4',
    'ntpdate'      => '4.2.4p8-3.el6.centos',
    'rpm-build'    => '4.8.0-32.el6',
    'rsync'        => '3.0.6-9.el6',
    'screen'       => '4.0.3-16.el6',
    'telnet'       => '0.17-47.el6_3.1',
    'tmux'         => '1.5-1.el6',
    'tree'         => '1.5.3-2.el6',
    'tree'         => '1.5.3-2.el6',
    'vim-enhanced' => '7.2.411-1.8.el6',
    'wget'         => '1.12-1.8.el6',
    'yum-utils'    => '1.1.30-14.el6',
    'zsh'          => '4.3.10-5.el6',
  }
when 'amazon'
  default.nupic.packages.system.nucleus = {
    'bind-utils'   => '9.8.2-0.17.rc1.29.amzn1',
    'cronie'       => '1.4.4-7.5.amzn1',
    'curl'         => '7.27.0-9.32.amzn1',
    'dash'         => '0.5.5.1-4.5.amzn1',
    'daemonize'    => '1.7.3-1.el6',
    'emacs'        => '23.1-21.15.amzn1',
    'git'          => '1.8.1.4-1.27.amzn1',
    'htop'         => '1.0.1-2.el6',
    'iotop'        => '0.3.2-3.2.amzn1',
    'logrotate'    => '3.7.8-16.11.amzn1',
    'lsof'         => '4.82-4.10.amzn1',
    'man'          => '1.6f-32.10.amzn1',
    'ntpdate'      => '4.2.6p5-2.21.amzn1',
    'rpm-build'    => '4.8.0-32.40.amzn1',
    'rsync'        => '3.0.6-9.12.amzn1',
    'screen'       => '4.0.3-16.5.amzn1',
    'telnet'       => '0.17-47.7.amzn1',
    'tmux'         => '1.7-1.4.amzn1',
    'tree'         => '1.6.0-5.7.amzn1',
    'vim-enhanced' => '7.2.411-1.8.17.amzn1',
    'wget'         => '1.14-3.9.amzn1',
    'yum-utils'    => '1.1.30-14.13.amzn1',
    'zsh'          => '4.3.10-5.6.amzn1'
  }
end

# By default, we are not running in Vagrant.
# default.nn.instance.vagrant = false
# default.nn.tags.vagrant     = false
