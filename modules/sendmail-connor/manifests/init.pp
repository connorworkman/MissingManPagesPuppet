class sendmail-connor {
	package {
		"sendmail": ensure => installed;
	}

	file {"/etc/mail/sendmail.conf":
		mode 	=> 644,
		owner	=> "root",
		group	=> "smmsp",
		source	=> "puppet:///modules/sendmail-connor/sendmail.conf",
		require	=> Package["sendmail"],
	}

	file {"/etc/mail/sendmail.cf":
		mode	=> 644,
		owner	=> "root",
		group	=> "smmsp",
		source	=> "puppet:///modules/sendmail-connor/sendmail.cf",
		require	=> Package["sendmail"],
	}

	file {"/etc/mail/sendmail.mc":
		mode	=> 644,
		owner	=> "root",
		group	=> "smmsp",
		source	=> "puppet:///modules/sendmail-connor/sendmail.mc",
		require => Package["sendmail"],
	}

	file {"/etc/mail/submit.cf":
		mode	=> 644,
		owner	=> "root",
		group	=> "smmsp",
		source	=> "puppet:///modules/sendmail-connor/submit.cf",
		require	=> Package["sendmail"],
	}

	file {"/etc/mail/submit.mc":
		mode	=> 644,
		owner	=> "root",
		group	=> "smmsp",
		source	=> "puppet:///modules/sendmail-connor/submit.mc",
		require	=> Package["sendmail"],
	}


	service {"networking":
		enable	=> true,
		ensure	=> running,
	}
}
