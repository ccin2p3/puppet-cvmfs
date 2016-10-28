#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class cvmfs::config
#
# This class is called from cvmfs
# It should include common resource classes
#  e.g. configuration Files
#
class cvmfs::config {
  file { "/etc/cvmfs.conf":
    ensure  => present,
    content => template('cvmfs/conf.erb'),
  }
}
# vim: ft=puppet
