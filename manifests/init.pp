# install everything required to be a git client
class git (
  $sources = "https://git-osx-installer.googlecode.com/files/git-1.8.3.2-intel-universal-snow-leopard.dmg"
){
  include git::params

  ensure_packages($git::params::packages, {
    ensure => 'installed',
    source => $sources,
  })
}
