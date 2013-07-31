# install everything required to be a git client
class git (
  $sources = "https://git-osx-installer.googlecode.com/files/git-1.8.3.2-intel-universal-snow-leopard.dmg"
){

  include git::params

  package { $git::params::packages:
    ensure => present,
    source => $sources,
  }
}
