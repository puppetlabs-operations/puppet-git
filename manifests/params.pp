# = Class: git::params
#
class git::params {
  case $::operatingsystem {
    'Debian': { $packages = 'git' }
    'Ubuntu': { $packages = 'git-core' }
    'Ubuntu': {
      case $::operatingsystemrelease {
        'Hardy', 'Lucid': { $packages = 'git-core' }
        default: { $packages = 'git' }
      }
    }
    'CentOS', 'SLES', 'Ubuntu', 'RedHat', 'Fedora': { $packages = 'git' }
    'FreeBSD': { $packages = 'devel/git' }
    'Darwin': {
      $packages = 'git'
      file { '/usr/local/bin':
        ensure => directory,
        require => Package[$git::params::packages],
      }
      file { '/usr/local/bin/git':
        ensure => link,
        target => '/usr/local/git/bin/git',
        require => File['/usr/local/bin'],
      }
    }
    default:   { fail("No git package known for operating system ${::operatingsystem}") }
  }
}
