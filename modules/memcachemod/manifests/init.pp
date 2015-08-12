class memcachemod {
        #require memcached config file
        file {"/etc/memcached.conf":
            mode    => 0640,
            group   => "root",
            owner   => "root",
            source  => "puppet:///modules/memcachemod/memcached/memcached.conf",
            notify  => Service["memcached"],
        }
        service {"memcached":
            subscribe   => File["/etc/memcached.conf"],
            enable  => true,
            ensure  => running,
            require => Package["memcached"],
        }
        package {"memcached":
            ensure  => installed,
        }
        package {"zip":
            ensure  => installed,
        }
}
