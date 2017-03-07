#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class cvmfs::foo::params
#
# This class is called from cvmfs::foo
# It sets platform specific defaults
#
class cvmfs::foo::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'cvmfs-foo'
      $service_name = 'cvmfs-foo'
    }
    'RedHat', 'Amazon': {
      case $::operatingsystemmajrelease {
        '6', '7': {
          $package_name = 'cvmfs-foo'
          $service_name = 'cvmfs-foo'
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
