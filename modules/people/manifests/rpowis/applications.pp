# Declare applications that you want to be installed on YOUR machine

class people::rpowis::applications {
	# Remember to add the module to your Puppetfile
	# then uncomment the following line and change 'module-name' for the real module

	# include module-name
  package { 
    [
    	'alfred',
    	'slate',
    	'vmware-fusion'
    ]:
    provider => 'brewcask'
  }

}
