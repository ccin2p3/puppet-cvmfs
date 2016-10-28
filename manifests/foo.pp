#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class cvmfs::foo
# This class implements functionality 'foo'
# In this boilerplate the class includes 3 subclasses respectively responsible
# for providing Package, configuration and Service resources
#
class cvmfs::foo (
  $package_name = $cvmfs::foo::params::package_name,
  $service_name = $cvmfs::foo::params::service_name,
) inherits cvmfs::foo::params {

  # validate parameters here

  class { 'cvmfs::foo::install': } ->
  class { 'cvmfs::foo::config': } ~>
  class { 'cvmfs::foo::service': } ->
  Class['cvmfs::foo']
}
# vim: ft=puppet
