class httpd {
	package {
		"apache2": ensure => installed;
	}

	file { "/etc/apache2/apache2.conf":
		notify	=> Service["apache2"],
		mode	=> 644,
		owner	=> "root",
		group	=> "root",
		source	=> "puppet:///modules/httpd/apache2.conf",
		require => Package["apache2"],
	}

	service { "apache2":
		enable	=> true,
		ensure	=> running,
		require	=>	[ Package["apache2"],
				  File["/etc/apache2/apache2.conf"], ],
	}
}
