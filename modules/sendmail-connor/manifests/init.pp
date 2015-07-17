class sendmail-connor {
	package {
		"sendmail": ensure => installed;
	}

	file {"/etc/mail/sendmail.conf":
		mode 	=> 444,
		owner	=> "root",
		group	=> "smmsp",
		source	=> "puppet:///modules/sendmail-connor/sendmail.conf",
		require	=> Package["sendmail"],
	}

	file {"/etc/mail/sendmail.cf":
		mode	=> 444,
		owner	=> "root",
		group	=> "smmsp",
		source	=> "puppet:///modules/sendmail-connor/sendmail.cf",
		require	=> Package["sendmail"],
	}


	file {"/etc/mail/submit.cf":
		mode	=> 444,
		owner	=> "root",
		group	=> "smmsp",
		source	=> "puppet:///modules/sendmail-connor/submit.cf",
		require	=> Package["sendmail"],
	}

	file {"/etc/mail/submit.mc":
		mode	=> 444,
		owner	=> "root",
		group	=> "smmsp",
		source	=> "puppet:///modules/sendmail-connor/submit.mc",
		require	=> Package["sendmail"],
	}


	service {"networking":
		enable	=> true,
		ensure	=> running,
	}


	file { "/etc/mail/sendmail.mc":
		mode   => 444,
		owner  => "root",
		group  => "smmsp",
		source => "puppet://modules/sendmail/sendmail.mc",
		notify => [ Exec["/usr/bin/make -C /etc/mail"],
			    Service["sendmail"] ],
	}

	exec {"/usr/bin/make -C /etc/mail":
              refreshonly => true,
              require     => Package["sendmail-cf"],
	}

	file { "/etc/mail/local-host-names":
		mode   => 444,
		owner  => "root",
		group  => "root",
		source => "puppet://modules/sendmail/local-host-names",
		notify => Service["sendmail"],
	}

	service { "sendmail":
		enable => true,
		ensure => running,
		require => Package["sendmail"],
	}
}
