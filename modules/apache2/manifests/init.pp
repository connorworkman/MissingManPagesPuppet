class apache2 {
	file { "/etc/apache/apache2.conf":
		mode	=> 644,
		owner	=> "root",
		group	=> "root",
		source	=> "puppet:///modules/apache2/apache2.conf",
	}
}
