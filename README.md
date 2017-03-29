# roundcube Module

## Overview

This module install and configure roundcube webmail.

## Usage

Default configuration:

```puppet
include roundcube
```

Change configuration file settings:

```puppet
class { 'roundcube':
    db_dsnw        => 'mysql://root:password@localhost/roundcubedb',
    default_host   => 'localhost',
    default_port   => '143',
    smtp_server    => '127.0.0.1',
    smtp_port      => '587',
    smtp_user      => '%u',
    smtp_pass      => '%p',
    smtp_auth_type => 'LOGIN',
    product_name   => 'Webmail',
    useragent      => "'User agent'",
    plugins        => "array('virtuser_query')",
    config         => {
        'virtuser_query'        => "SELECT email FROM emaildb.usertb WHERE email = '%u'",
    },
}
```


