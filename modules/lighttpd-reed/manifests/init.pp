class lighttpd-reed {
	package {
		"lighttpd": ensure => installed;
	}

	file { "/etc/lighttpd/lighttpd.conf":
		notify	=> Service["lighttpd"],
		mode	=> 644,
		owner	=> "root",
		group	=> "root",
		source	=> "puppet:///modules/lighttpd-reed/lighttpd.conf",
		require => Package["lighttpd"],
	}

	file { "/var/www/index.html":
		mode	=> 644,
		owner	=> "root",
		group	=> "root",
		source	=> "puppet:///modules/lighttpd-reed/index.html",
		require => Package["lighttpd"],
	}

	file { "/var/www/otherfile.html":
		mode	=> 644,
		owner	=> "root",
		group	=> "root",
		source	=> "puppet:///modules/lighttpd-reed/otherfile.html",
		require => Package["lighttpd"],
	}

	file { "/etc/lighttpd/cat.png":
		mode	=> 644,
		owner	=> "root",
		group	=> "root",
		source	=> "puppet:///modules/lighttpd-reed/cat.png",
		require => Package["lighttpd"],
	}

	service { "lighttpd":
		enable	=> true,
		ensure	=> running,
		require	=>	[ Package["lighttpd"],
				  File["/etc/lighttpd/lighttpd.conf"],
				],
	}

	service { "apache2":
		enable => false,
		ensure => stopped
		}
}
