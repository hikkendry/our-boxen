class people::rpowis::dotfiles {

  repository { "${boxen::config::srcdir}/dotfiles":
    source => "rpowis/dotfiles"
  }

  repository { "${boxen::config::srcdir}/rpowis-zshtheme":
    source => "https://gist.github.com/3169614.git"
  }

  file { "boostrap perms":
  	path => "${boxen::config::srcdir}/dotfiles/bootstrap.sh",
  	ensure => present,
  	mode => "u+x"
  }

	exec { "run bootstrap":
		command => "sh ${boxen::config::srcdir}/dotfiles/bootstrap.sh -f",
	  require => File["boostrap perms"]
	}

	file { "/Users/${boxen_user}/.oh-my-zsh/themes/rpowis.zsh-theme":
		ensure => symlink,
		target => "${boxen::config::srcdir}/rpowis-zshtheme/rpowis.zsh-theme",
		require => Repository["${boxen::config::srcdir}/rpowis-zshtheme"]
	}

  # Set the shell
#	exec { "sudo chsh -s /bin/zsh ${boxen_user}":
#		require => Exec["run bootstrap"]
#	}

}