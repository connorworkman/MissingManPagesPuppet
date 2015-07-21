import 'classes/*.pp'

#connor's instance
node ip-10-0-4-226 {
	include sshd
	include lighttpd-reed
	include sendmail-connor
}

#joey's instance
node ip-10-0-4-27 {
	include sshd
	include lighttpd-reed
}

#puppetmaster (reed's instance)
node ip-10-0-4-230 {
	cron { "puppet update":
		command	=> "cd /etc/puppet && git pull origin master && echo 'Update occurred.'",
		user	=> root,
		minute	=> "*/5",
	}
#	include httpd
	include sshd
	include sendmail-reed
	include lighttpd-reed
}
