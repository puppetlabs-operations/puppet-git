# install everything required to be a git client
class git (
  $ensure  = present,
  $sources = "https://git-osx-installer.googlecode.com/files/git-1.8.3.2-intel-universal-snow-leopard.dmg"
){

  include git::params

  case $::operatingsystem {
    'Darwin': {
      package { $git::params::packages:
        ensure => $ensure,
        source => $sources
      }
    }
    default: {
      package { $git::params::packages:
        ensure => $ensure
      }
    }
  }
}
