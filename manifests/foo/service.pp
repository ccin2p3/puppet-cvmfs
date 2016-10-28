#
# Copyright (c) IN2P3 Computing Centre, IN2P3, CNRS
#
# Contributor(s) : ccin2p3
#

# == Class cvmfs::foo::service
#
# This class is called from cvmfs::foo
# It ensures the foo service is running
#
class cvmfs::foo::service {
  service { $cvmfs::foo::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
# vim: ft=puppet
