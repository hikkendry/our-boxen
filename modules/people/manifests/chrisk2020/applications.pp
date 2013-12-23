# Declare applications that you want to be installed on YOUR machine

class people::chrisk2020::applications {
	# Remember to add the module to your Puppetfile
	# then uncomment the following line and change 'module-name' for the real module


	# now you can install packages using homebrew-cask
	package { 
    [
      'skype',
      'sourcetree',
      'omnigraffle',
      'gas-mask'
    ]:
    provider => 'brewcask'
  }
}
