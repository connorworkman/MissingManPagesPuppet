class masterdb {
    package {"mysql-server-5.6":
        ensure  => installed,
    }
    package {"mysql-client-5.6":
        ensure  => installed,
    }
    package {"mysql-server-core-5.6":
        ensure  => installed,
    }
    service {"mysql":
        enable  => true,
        ensure  => running,
        require => Package["mysql-server-5.6"],
    }
}
