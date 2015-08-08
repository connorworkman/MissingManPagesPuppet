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
            mode    => 0750,
        }

        file {"/var/www/roundcubemail-1.1.2/logs/":
            ensure  => directory,
            owner   => "www-data",
            group   => "www-data",
            mode    => 0750,
        }
	    
        #require packages for dovecot
	    package { "dovecot-imapd":
	    	ensure	=> installed,
	    }
	    package { "dovecot-mysql":
	    	ensure	=> installed,
	    }

	    #require configuration-files for dovecot (includes /etc/dovecot/....)
        file {"/etc/dovecot/dovecot.conf":
            mode    => 0644,
            owner   => "root",
            group   => "root",
            source  => "puppet:///modules/webmail/dovecot/dovecot.conf",
            notify  => Service["dovecot"],
        }

        file { "/etc/dovecot/conf.d/":
            ensure  => directory,
            recurse => true,
            purge   => false,
            force   => true,
            owner   => "root",
            group   => "root",
            mode    => 0644,
            source  => "puppet:///modules/webmail/dovecot/conf.d",
        }
        service {"dovecot":
            enable  => true,
            ensure  => running,
            require => [ Package["dovecot-imapd"], Package["dovecot-mysql"] ],
            subscribe => File["/etc/dovecot/dovecot.conf"],
        }
	    #require package php5-fpm
	    #require configuration-files php5-fpm (includes /etc/php5-fpm/....)
	
}
