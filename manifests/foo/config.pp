#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class cvmfs::foo::config
#
# This class is called from cvmfs::foo
# It should provide its configuration resources
#
class cvmfs::foo::config {
  file { '/etc/cvmfs':
    ensure => directory
  } ->
  file { '/etc/cvmfs/foo.conf':
    ensure  => present,
    content => template('cvmfs/foo.conf.erb')
  }
}
# vim: ft=puppet
