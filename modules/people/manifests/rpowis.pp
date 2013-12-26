#
# Personal config for Rory Powis
#

class people::rpowis {
	# Include files from your personal directory
	include people::rpowis::dotfiles
	include people::rpowis::applications
}
