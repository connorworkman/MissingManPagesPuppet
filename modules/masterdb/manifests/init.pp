class masterdb {
    package {"mysql-server":
        ensure  => installed,
    }
    service {"mysql":
        enable  => true,
        ensure  => running,
        require => Package["mysql-server"],
    }
    package {"php5-mysql":
        ensure  => installed,
    }
    package {"php5-memcached":
        ensure  => installed,
    }
    package {"memcached":
        ensure  => installed,
    }

    file {"/etc/memcached.conf":
        mode    => 0640,
        owner   => "root",
        group   => "root",
        notify  => Service["memcached"], 
    }
    service {"memcached":
        enable  => true,
        ensure  => running,
        subscribe   => File["/etc/memcached.conf"],
    }
}
