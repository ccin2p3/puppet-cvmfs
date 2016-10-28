#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class cvmfs::install
#
# This class is called from cvmfs
# It ensures Package resources are present
#
class cvmfs::install {
  package { $cvmfs::package_name:
    ensure => present,
  }
}
# vim: ft=puppet
