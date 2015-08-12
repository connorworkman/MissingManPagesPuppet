class dovecotmod {
        #require packages for dovecot
	    package { "dovecot-imapd":
	    	ensure	=> installed,
	    }
	    package { "dovecot-mysql":
	    	ensure	=> installed,
	    }

	    #require configuration-files for dovecot (includes /etc/dovecot/....)
        file {"/etc/dovecot/dovecot.conf":
            mode    => 0644,
            owner   => "root",
            group   => "root",
            source  => "puppet:///modules/dovecotmod/dovecot/dovecot.conf",
            notify  => Service["dovecot"],
        }

        file { "/etc/dovecot/conf.d/":
            ensure  => directory,
            recurse => true,
            purge   => false,
            force   => true,
            owner   => "root",
            group   => "root",
            mode    => 0644,
            source  => "puppet:///modules/dovecotmod/dovecot/conf.d",
        }
        service {"dovecot":
            enable  => true,
            ensure  => running,
            require => [ Package["dovecot-imapd"], Package["dovecot-mysql"], File["/etc/dovecot/dovecot.conf"] ],
            subscribe => File["/etc/dovecot/dovecot.conf"],
        }
}
