class sshd {
	package {
		"openssh-server": ensure => installed;
	}

	file { "/etc/ssh/sshd_config":
		mode	=> 444,
		owner	=> "root",
		group	=> "root",
		source	=> "puppet:///modules/sshd/sshd_config",
		require => Package["openssh-server"],
	}

	service { "ssh":
		enable	=> true,
		ensure	=> running,
		require	=>	[ Package["openssh-server"],
				  File["/etc/ssh/sshd_config"], ],
	}
}

