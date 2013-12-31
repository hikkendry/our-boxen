class hikkendry::environment {
	
	# core modules
  # include ohmyzsh
  # include brewcask
  
  # development
  include dnsmasq
  include hikkendry::apache
  include hikkendry::php
  # include hikkendry::ruby
  # include hikkendry::node

  # applications
  # include hikkendry::applications

  # iterm colour theme
  # repository { "solarized":
  # 	path => "${boxen::config::srcdir}/solarized",
  #   source => "altercation/solarized"
  # }

}
