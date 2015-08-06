class webmail {
	package {
		"sendmail": ensure => installed;
	}
	package {
		"sendmail-cf": ensure => installed;
	}

	service {"networking":
		enable	=> true,
		ensure	=> running,
	}

    	file { "/var/www/roundcubemail-1.1.2/":
        	ensure	=> directory,
        	recurse => true,
        	purge   => true,
        	force   => true,
        	owner   => "root",
        	group   => "root",
        	mode    => 0644,
        	source  => "puppet:///modules/webmail/roundcubemail-1.1.2/",
    	}


}
