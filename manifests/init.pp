#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class: cvmfs
#
# Full description of class cvmfs here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class cvmfs (
  $package_name = $cvmfs::params::package_name,
  $service_name = $cvmfs::params::service_name,
) inherits cvmfs::params {

  # validate parameters here

  class { 'cvmfs::install': } ->
  class { 'cvmfs::config': } ~>
  class { 'cvmfs::service': } ->
  Class['cvmfs']
}
# vim: ft=puppet
