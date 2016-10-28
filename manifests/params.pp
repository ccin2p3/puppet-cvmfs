#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class cvmfs::params
#
# This class is called from cvmfs
# It sets platform specific defaults
#
class cvmfs::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'cvmfs'
      $service_name = 'cvmfs'
    }
    'RedHat', 'Amazon': {
      case $::operatingsystemmajrelease {
        '6', '7': {
          $package_name = 'cvmfs'
          $service_name = 'cvmfs'
        }
        default: {
          fail("operatingsystemmajrelease `${::operatingsystemmajrelease}` not supported")
        }
      }
    }
    default: {
      fail("osfamily `${::osfamily}` not supported")
    }
  }
}

# vim: ft=puppet
