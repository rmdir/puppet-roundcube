# == Class: roundcube
#
# === Examples
#
#  include roundcube
#
#  class { 'roundcube':
#    db_dsnw        => 'mysql://root:password@localhost/roundcubedb',
#    default_host   => 'localhost',
#    default_port   => '143',
#    smtp_server    => '127.0.0.1',
#    smtp_port      => '587',
#    smtp_user      => '%u',
#    smtp_pass      => '%p',
#    smtp_auth_type => 'LOGIN',
#    product_name   => 'Webmail',
#    useragent      => "'User agent'",
#    plugins        => "array('virtuser_query')",
#    config         => {
#      'virtuser_query'        => "SELECT email FROM emaildb.usertb WHERE email = '%u'",
#    },
#  }
#
# === Authors
#
# Aneesh C <aneeshchandrasekharan@gmail.com>
#

class roundcube (
  $package_name   = $::roundcube::params::package_name,
  $configfile     = $::roundcube::params::configfile,
  $template       = $::roundcube::params::template,
  $db_dsnw        = undef,
  $default_host   = undef,
  $default_port   = undef,
  $smtp_server    = undef,
  $smtp_port      = undef,
  $smtp_user      = undef,
  $smtp_pass      = undef,
  $smtp_auth_type = undef,
  $product_name   = undef,
  $useragent      = undef,
  $plugins        = undef,
  $config         = [],
) inherits roundcube::params {
  package { $package_name: ensure => installed }
  file { $configfile:
    require => package[$package_name],
    content => template($template),
  }
}
