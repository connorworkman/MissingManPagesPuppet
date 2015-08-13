class apache2{
	package {
		"apache2": ensure => installed;
        	"php5-cgi": ensure => installed;
        	"libapache2-mod-php5": ensure => installed;
        	"libapache2-mod-gnutls": ensure => installed;
	}
    
	file { "/etc/apache2/apache2.conf":
		notify	=> Service["apache2"],
		mode	=> 644,
		owner	=> "root",
		group	=> "root",
		source	=> "puppet:///modules/apache2/apache2.conf",
		require => Package["apache2"],
	}

    file { "/var/www/":
        ensure => directory,
        recurse => true,
        purge   => false,
        #purge is now set to false so that webmail can share /var/www/
        owner   => "root",
        group   => "root",
        mode    => 0644,
        source  => "puppet:///modules/apache2/site_content/",
    }

        file { "/etc/apache2/conf-enabled/000-webmail.conf":
                notify  => Service["apache2"],
                ensure  => link,
                target  => "/etc/apache2/conf-available/000-webmail.conf",
                require => Package["apache2"],
        }

    file { "/etc/apache2/conf-enabled/php5-cgi.conf":
		notify	=> Service["apache2"],
		ensure	=> link,
		target	=> "/etc/apache2/conf-available/php5-cgi.conf",
		require => Package["apache2"],
	}

    file { "/etc/apache2/conf-enabled/php5-cgi-enabled.conf":
		notify	=> Service["apache2"],
		ensure	=> link,
		target	=> "/etc/apache2/conf-available/php5-cgi-enabled.conf",
		require => Package["apache2"],
	}

    file { "/etc/apache2/mods-enabled/rewrite.load":
		notify	=> Service["apache2"],
		ensure	=> link,
		target	=> "/etc/apache2/mods-available/rewrite.load",
		require => Package["apache2"],
	}

    file { "/etc/apache2/conf-available/000-webmail.conf":
		notify	=> Service["apache2"],
		mode	=> 644,
		owner	=> "root",
		group	=> "root",
		source	=> "puppet:///modules/apache2/000-webmail.conf",
		require => Package["apache2"],
	}

    file { "/etc/apache2/conf-available/php5-cgi-enabled.conf":
		notify	=> Service["apache2"],
		mode	=> 644,
		owner	=> "root",
		group	=> "root",
		source	=> "puppet:///modules/apache2/php5-cgi-enabled.conf",
		require => Package["apache2"],
	}

	service { "lighttpd":
		enable	=> false,
		ensure	=> stopped,
	}

	service { "apache2":
		enable => true,
		ensure => running,
		require	=>	[ Package["apache2"],
				  File["/etc/apache2/apache2.conf"],
				],
		}
}
