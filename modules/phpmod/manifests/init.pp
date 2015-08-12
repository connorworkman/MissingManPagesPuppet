class phpmod {
        file {"/etc/php5/fpm/php.ini":
            mode    => 0644,
            group   => "root",
            owner   => "root",
            source  => "puppet:///modules/phpmod/php5/fpm/php.ini",
            notify  => Service["php5-fpm"],
        }

        file {"/etc/php5/cgi/php.ini":
            mode    => 0644,
            group   => "root",
            owner   => "root",
            source  => "puppet:///modules/phpmod/php5/cgi/php.ini",
        }
        file {"/etc/php5/cli/php.ini":
            mode    => 0644,
            group   => "root",
            owner   => "root",
            source  => "puppet:///modules/phpmod/php5/cli/php.ini",
        }

	    #require package php5-fpm
	    #require configuration-files php5-fpm (includes /etc/php5-fpm/....)
        package {"php5-fpm":
            ensure  => installed,
        }
        #require php5-fpm service enabled, running, and subscribed 
        service {"php5-fpm":
            enable      => true,
            ensure      => running,
            subscribe   => File["/etc/php5/fpm/php.ini"],
        }
        package {
            "php5-cli":         ensure  => installed,
            "php5-mysql":       ensure  => installed,
            "php5-memcached":   ensure  => installed,
            "php5-memcache":    ensure  => installed,
        }
}
