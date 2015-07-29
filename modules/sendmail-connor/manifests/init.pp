class sendmail-connor {
	package {
		"sendmail": ensure => installed;
	}
	package {
		"sendmail-cf": ensure => installed;
	}

	file {"/etc/mail/sendmail.conf":
		notify	=> Service["sendmail"],
		mode 	=> 644,
		owner	=> "root",
		group	=> "root",
		source	=> "puppet:///modules/sendmail-connor/sendmail.conf",
		require	=> Package["sendmail"], #consider adding multiple package requirements here and testing sendmail further
	}

	service {"networking":
		enable	=> true,
		ensure	=> running,
	}


	file { "/etc/mail/sendmail.mc":
		mode   => 644,
		owner  => "root",
		group  => "smmsp",
		source => "puppet:///modules/sendmail-connor/$hostname/sendmail.mc",
		notify => [ Exec["/usr/bin/make -C /etc/mail"],
			    Service["sendmail"] ],
	}
    file { "/etc/mail/sendmail.cf":
        notify  => Service["sendmail"],
        mode    => 0644,
        owner   => "root",
        group   => "root",
        source  => "puppet:///modules/sendmail-connor/$hostname/sendmail.cf",
        require => Package["sendmail"],
    }

	exec {"/usr/bin/make -C /etc/mail":
              refreshonly => true,
              require     => Package["sendmail-cf"],
	}

	file { "/etc/mail/local-host-names":
		mode   => 644,
		owner  => "root",
		group  => "smmsp",
		source => "puppet:///modules/sendmail-connor/$hostname/local-host-names",
		notify => Service["sendmail"],
	}

	service { "sendmail":
		enable => true,
		ensure => running,
		require => Package["sendmail"],
		subscribe => [ File["/etc/mail/local-host-names"], File["/etc/mail/sendmail.mc"] ],
	}
}
