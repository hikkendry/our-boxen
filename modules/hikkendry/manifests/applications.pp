class hikkendry::applications {

  # Common applications

  # Always install apps with brewcask if you can.
  # To see which apps are available for download visit:
  # https://github.com/phinze/homebrew-cask/tree/master/Casks
  # or run: `$ brew cask search APP_NAME` to find its name
  $apps = [
    'copy',
    'dropbox',
    'firefox',
    'google-chrome',
    'google-drive',
    'iterm2',
    'sublime-text',
    'sequel-pro',
    'skype',
    'vagrant',
    'virtualbox'
  ]

  package { $apps:
    provider => "brewcask"
  }

#  exec { "sudo brew cask alfred link":
#    require => Package[$apps]
#  }

}