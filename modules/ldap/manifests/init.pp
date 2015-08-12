class ldap {
    package {"slapd":
        ensure  => installed,
    }
    package {"php5-ldap":
        ensure  => installed,
    }
    package {"ldap-utils":
        ensure  => installed,
    }
}
