#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class cvmfs::foo::install
#
# This class is called from cvmfs::foo
# It should provide its package resources
#
class cvmfs::foo::install {
  package { $cvmfs::foo::package_name:
    ensure => present,
  }
}
# vim: ft=puppet
