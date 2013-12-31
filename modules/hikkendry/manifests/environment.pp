class hikkendry::environment {
	
	# core modules
  include ohmyzsh
  include brewcask
  
  # languages
  include hikkendry::apache
  include hikkendry::php
  include hikkendry::ruby
  # include hikkendry::node

  # applications
  include hikkendry::applications
}
