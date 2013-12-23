#
# Personal config for Chris Knight
#

class people::chrisk2020 {

	# Include applications from your directory
	include people::chrisk2020::applications

	# Include webstuf from your directory
	include people::chrisk2020::webstuff

	include osx::finder::show_hidden_files
}
