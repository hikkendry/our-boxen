class hikkendry::php {

  # php environment
  include wget
  include autoconf
  include libtool
  include pkgconfig
  include pcre
  include libpng
  include mysql

	# default php versions
  include php::5_4

  # TODO: tidy this shit up!!
  exec { "fix freetype for php":
    command => "${boxen::config::repodir}/manifests/freetype.sh | sh",
    creates => "${boxen::config::homedir}/homebrew/Cellar/freetype/2.4.11/lib/libfreetype.a",
    before => Exec['phpenv-setup-root-repo']
  }

  # mysql
  # mysql::db { 'mydb': }

}