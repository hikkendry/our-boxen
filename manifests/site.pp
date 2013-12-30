require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::home}/homebrew/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include ohmyzsh
  include dnsmasq
  include git
  include brewcask
  # include hub
  # include nginx

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail("Please enable full disk encryption and try again. You can enable this in 'System Preferences > Security & Privacy > FileVault'.")
  }

  # node versions
  # include nodejs::v0_6
  # include nodejs::v0_8
  # include nodejs::v0_10

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar'
    ]:
  }

  include hikkendry::environment
  # common applications
  # always try and install using brewcask.
  # to see which apps are available for download visit:
  # https://github.com/phinze/homebrew-cask/tree/master/Casks
  # or run: `$ brew cask search APP_NAME` to find its name
  package { 
    [
      'sublime-text',
      'google-chrome',
      'firefox',
      'iterm2',
      'sequel-pro',
      'skype'
    ]:
    provider => 'brewcask'
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}
