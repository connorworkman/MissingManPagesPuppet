class webmail {
    	file { "/var/www/roundcubemail-1.1.2/":
        	ensure	=> directory,
        	recurse => true,
        	purge   => false,
        	force   => true,
        	owner   => "root",
        	group   => "root",
        	mode    => 0640,
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
	   
        file {"/var/www/roundcubemail-1.1.2/config/config.inc.php":
            mode    => 0644,
            owner   => "root",
            group   => "root",
            source  => "puppet:///modules/webmail/$hostname/config.inc.php",
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
        service {"mysql":
            enable  => true,
            ensure  => running,
            require => Package["mysql-server-5.6"],
        }
        package {"mysql-server-5.6":
            ensure  => installed,	
            notify  => Service["mysql"],
        }
        package {"zip":
            ensure  => installed,
        }
        file {"/etc/php5/fpm/php.ini":
            mode    => 0644,
            group   => "root",
            owner   => "root",
            source  => "puppet:///modules/webmail/php5/fpm/php.ini",
            notify  => Service["php5-fpm"],
        }

	    #require package php5-fpm
	    #require configuration-files php5-fpm (includes /etc/php5-fpm/....)
        package {"php5-fpm":
            ensure  => installed,
        }
        #require php5-fpm service enabled, running, and subscribed to its own config file
        service {"php5-fpm":
            enable => true,
            ensure  => running,
            subscribe => File["/etc/php5/fpm/php.ini"],
        }

        package {"php5-mysql":
            ensure  => installed,
        } 

        #require pam configuration files and permissions (/etc/pam.d/...)
        #require pam.conf empty file
        file { "/etc/pam.conf":
            mode    => 0644,
            owner   => "root",
            group   => "root",
            source  => "puppet:///modules/webmail/pam/pam.conf",
        }
}
