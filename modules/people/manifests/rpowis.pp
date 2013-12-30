#
# Personal config for Rory Powis
#

class people::rpowis {
	# Include files from your personal directory
	include people::rpowis::dotfiles
	include people::rpowis::applications

	file { "/Users/${boxen_user}/Developer":
		ensure => "directory"
	}

	file { "vagrant license":
		path => "/Users/${boxen_user}/Developer/vagrant-vmware-provider-license.lic",
		source => "/Users/${boxen_user}/Dropbox/Apps/vagrant-vmware-provider-license.lic",
		require => File["/Users/${boxen_user}/Developer"]
	}

	exec { "install vagrant-vmware-fusion":
		command => "/usr/bin/vagrant plugin install vagrant-vmware-fusion",
		require => Package["vagrant"]
	}

	exec { "/usr/bin/vagrant plugin license vagrant-vmware-fusion vagrant-vmware-provider-license.lic":
		cwd => "/Users/${boxen_user}/Developer",
		require => Exec["install vagrant-vmware-fusion"]
	}

}
