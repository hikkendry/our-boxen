class hikkendry::environment {
	
	# core modules
  include ohmyzsh
  include brewcask
  
  # development
  include dnsmasq
  include hikkendry::apache
  include hikkendry::php
  include hikkendry::ruby
  # include hikkendry::node

  # applications
  include hikkendry::applications
}
