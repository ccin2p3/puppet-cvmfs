#Class: cvmfs::zero::install , desingned
#to be included from instances of cvmfs::zero
class cvmfs::zero::install (
  $cvmfs_version        = $cvmfs::params::cvmfs_version,
  $cvmfs_kernel_version = $cvmfs::params::cvmfs_kernel_version,
  $cvmfs_aufs2_version  = $cvmfs::params::cvmfs_aufs2_version,
) {
  include ::cvmfs::zero::yum

  package{['cvmfs-server','cvmfs']:
    ensure  => $cvmfs_version,
    require => Yumrepo['cvmfs'],
  }
  # We grab latest kernel unless we have an aufs one running
  # already.

  case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease {
        '6': {
          unless $::kernelrelease  =~ /^.*aufs.*/ {
              notify{'An aufs kernel is not, install, upgrade, reboot until an aufs kernel is running':}
          }
          package{'kernel':
            ensure  => $cvmfs_kernel_version,
            require => Yumrepo['cvmfs-kernel'],
          }
          package{'aufs2-util':
            ensure  => $cvmfs_aufs2_version,
            require => Yumrepo['cvmfs-kernel'],
          }
        }
        '7': {
          notify{'CL7 aufs is not necessary':}
        }
        default: {
          fail("${::operatingsystem}: version ${::operatingsystemmajrelease} not tested yet")
        }
      }
    }
    'Debian': {
      fail("osfamily `${::osfamily}` not tested")
    }
    default: {
      fail("osfamily `${::osfamily}` not supported")
    }
  }  
  
  
  ensure_packages('httpd', { ensure => present, } )
}
