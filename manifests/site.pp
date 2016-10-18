import 'classes/*.pp'

#connor's instance
node ip-10-0-4-226 {
    include sshd
#   include lighttpd
    include sendmail
#   include webmail
    include phpmod
    include memcachemod
    include dovecotmod
}

#joey's instance
node ip-10-0-4-27 {
    include sshd
#   include lighttpd
    include apache2
#   include sendmail
    include webmail
    include phpmod
    include memcachemod
}

#puppetmaster (reed's instance)
node ip-10-0-4-230 {
    cron { "puppet update":
        command	=> "cd /etc/puppet && git pull origin master && echo 'Update occurred.'",
        user	=> root,
        minute	=> "*/5",
    }
    include masterdb
    include ldap
    include phpmod
    include memcachemod
    include sshd
    include sendmail
    include lighttpd-reed
}
