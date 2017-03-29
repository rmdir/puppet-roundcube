class roundcube::params {
  if $::osfamily == 'Redhat' {
    $package_name = [ 'roundcubemail' ]
    $configfile = '/etc/roundcubemail/config.inc.php'
    case $::operatingsystemrelease {
      /^6.*/: {
        $template = 'roundcube/config.inc.php.c.6.erb'
      }
      /^7.*/: {
        $template = 'roundcube/config.inc.php.c.7.erb'
      }
      default: {
        $template = 'roundcube/config.inc.php.c.6.erb'
      }
    }
  }
  if $::osfamily == 'Debian' {
    $package_name = [ 'roundcube', 'roundcube-mysql' ]
    case $::operatingsystemrelease {
      /^12.*/: {
        $configfile = '/etc/roundcube/main.inc.php'
        $template = 'roundcube/main.inc.php.u.12.erb'
      }
      /^14.*/: {
        $configfile = '/etc/roundcube/main.inc.php'
        $template = 'roundcube/main.inc.php.u.14.erb'
      }
      /^16.*/: {
        $configfile = '/etc/roundcube/config.inc.php'
        $template = 'roundcube/config.inc.php.u.16.erb'
      }
      default: {
        $configfile = '/etc/roundcube/main.inc.php'
        $template = 'roundcube/main.inc.php.u.12.erb'
      }
    }
  }
}
