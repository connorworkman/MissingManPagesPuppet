class webmail {
    	file { "/var/www/roundcubemail-1.1.2/":
        	ensure	=> directory,
        	recurse => true,
        	purge   => false,
        	force   => true,
        	owner   => "root",
        	group   => "root",
        	mode    => 0644,
        	source  => "puppet:///modules/webmail/roundcubemail-1.1.2/",
    	}
        
        #add folders with web server access privileges
        file {"/var/www/roundcubemail-1.1.2/temp/":
            ensure  => directory,
            owner   => "www-data",
            group   => "www-data",
            mode    => 0200,
        }
        file {"/var/www/roundcubemail-1.1.2/logs/":
            ensure  => directory,
            owner   => "www-data",
            group   => "www-data",
            mode    => 0200,
        }
	   
        file {"/var/www/roundcubemail-1.1.2/config/config.inc.php":
            mode    => 0400,
            owner   => "root",
            group   => "root",
            source  => "puppet:///modules/webmail/$hostname/config.inc.php",
        }

        #require mysql service and mysql packages
        service {"mysql":
            enable  => true,
            ensure  => running,
            require => Package["mysql-server-5.6"],
        }
        package {"mysql-server-5.6":
            ensure  => installed,	
            notify  => Service["mysql"],
        }
}
