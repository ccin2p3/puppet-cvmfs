#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class cvmfs::service
#
# This class is called from cvmfs
# It ensures the service is running
#
class cvmfs::service {

  service { $cvmfs::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
# vim: ft=puppet
