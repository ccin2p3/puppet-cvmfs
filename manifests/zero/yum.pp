# Class cvmfs::server::yum
class cvmfs::zero::yum (
  #$cvmfs_yum_kernel           = $cvmfs::params::cvmfs_yum_kernel,
  $cvmfs_yum_kernel           = hiera('cvmfs_yum_kernel','http://cern.ch/cvmrepo/yum/cvmfs-kernel/EL/${::operatingsystemmajrelease}/${::architecture}')
  $cvmfs_yum_kernel_enabled   = $cvmfs::params::cvmfs_yum_kernel_enabled,
  $cvmfs_yum                  = $cvmfs::params::cvmfs_yum,
  $cvmfs_yum_testing          = $cvmfs::params::cvmfs_yum_testing,
  $cvmfs_yum_testing_enabled  = $cvmfs::params::cvmfs_yum_testing_enabled,
) {

  yumrepo{'cvmfs':
    descr       => "CVMFS yum repository for el${::operatingsystemmajrelease}",
    baseurl     => $cvmfs_yum,
    gpgcheck    => 1,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CernVM',
    enabled     => 1,
    includepkgs => 'cvmfs,cvmfs-keys,cvmfs-server,cvmfs-config*',
    priority    => 80,
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-CernVM'],
  }
  yumrepo{'cvmfs-testing':
    descr       => "CVMFS yum testing repository for el${::operatingsystemmajrelease}",
    baseurl     => $cvmfs_yum_testing,
    gpgcheck    => 1,
    gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CernVM',
    enabled     => $cvmfs_yum_testing_enabled,
    includepkgs => 'cvmfs,cvmfs-keys,cvmfs-server,cvmfs-config*',
    priority    => 80,
    require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-CernVM'],
  }

  # Copy out the gpg key once only ever.
  file{'/etc/pki/rpm-gpg/RPM-GPG-KEY-CernVM':
    ensure  => file,
    source  => 'puppet:///modules/cvmfs/RPM-GPG-KEY-CernVM',
    replace => false,
    owner   => root,
    group   => root,
    mode    => '0644',
  }

 case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease {
        '6': {
          yumrepo{'cvmfs-kernel':
          descr       => "CVMFS yum kernel repository for el${::operatingsystemmajrelease}",
          baseurl     => $cvmfs_yum_kernel,
          gpgcheck    => 1,
          gpgkey      => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CernVM',
          enabled     => $cvmfs_yum_kernel_enabled,
          includepkgs => 'kernel,aufs2-util,kernel-*,kmod-zfs-*,kmod-spl-*',
          priority    => 5,
          require     => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-CernVM'],
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
}

