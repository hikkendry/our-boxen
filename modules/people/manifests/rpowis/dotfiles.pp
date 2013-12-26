class people::rpowis::dotfiles {

  repository { '${boxen::config::srcdir}/dotfiles':
    source => 'rpowis/dotfiles',
  }

  file { '${boxen::config::srcdir}/dotfiles/bootstrap.sh':
  	ensure => present,
  	mode => 'u+x'
  }

#	exec { "/Users/${boxen_user}/.zshrc":
#	  ensure  => link,
#	  mode    => '0644',
#	  target  => "${boxen::config::srcdir}/dotfiles/.zshrc",
#	  require => Repository["${boxen::config::srcdir}/dotfiles"],
#	}

#  file { "/Users/${my_username}/.oh-my-zsh":
#    ensure  => link,
#    target  => "${boxen::config::srcdir}/oh-my-zsh",
#    require => Repository["${boxen::config::srcdir}/oh-my-zsh"],
#  }

}