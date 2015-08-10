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
}
