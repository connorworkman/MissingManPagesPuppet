class another-module {
#	package {
#		"openssh-server": ensure => installed;
#	}

	file { "/tmp/this-file-will-always-exist":
		mode	=> 444,
		owner	=> "ubuntu",
		group	=> "ubuntu",
		source	=> "puppet:///modules/another-module/persistent-file",
#		require => Package["openssh-server"],
	}

#	service { "ssh":
#		enable	=> true,
#		ensure	=> running,
#		require	=>	[ Package["openssh-server"],
#				  File["/etc/ssh/sshd_config"], ],
#	}
#
#
#	ssh_authorized_key { "cworkman-cis399":
#		user 	=> "ubuntu",
#		key 	=> "AAAAB3NzaC1yc2EAAAADAQABAAABAQCKV8VAfFXdCfTPlYaNXBVhDx0TkBJA6fo670oXHKZXHD1nDRXQTF98pkfodiMQoKXnjIsn8LbL4+oFlYFw97xFGPDvBQBVvla25H5SxXkLbTWAHA++/W7rEL1tHQJG+I88o86ztMymG2YuCGgT7b/zCZpBDM7ziOrxR71r7XamSkU6pYVAtgEKleir7OCrS1plBKPqM/qAOrgDQPy6uXnG6QlJJyL2lFNXkPf2qUBcjx1d/Hi7Z7WIZWkESyi5rgv7rITbNvskCtPzxoI2p42q7Czltrq+EKUlQaBC4eJ3TNKqSnChiJuwZvOVitPDEDppwPzLZvIUya+ZHzEl1kWt",
#	}
#
#
#	ssh_authorized_key { "MMP_AWSj0_0":
#		user	=> "ubuntu",
#		key	=> "AAAAB3NzaC1yc2EAAAADAQABAAABAQCDTporfqBT92ANxmz2gWrEfHEY5lHOdEdOczfjtb4fC89UvOYJTbF/ekCc5Px2taF48q64OMWQpiUhCWBiioofNQcEDb54Npmy8/A9+Tro7sXXxWxQuUC0Hssy1QgWMTODjz3EJzVzOt8fdKQ5vo5pZNUHS2xVSmtKojX8/3WufbjeKo30SPhot9P7C4BnlTb+CBr0IzbhDi78tsBcU3xYNNZK/g+eqcMSBxOCj1Q4dxYg2aX5LmsqlaiogEuEBZBGYNxKYHlaPdmc8+hyM4is0sWzCTsnpCmsZz6MoiQ7bR7pdRqoZYRXgA6rqjeAkr5M0dyfJmqk6OsHee8QNblD",
#	}
#
#
#	ssh_authorized_key { "2015-06-25 reedrs":
#		user	=> "ubuntu",
#		key	=> "AAAAB3NzaC1yc2EAAAADAQABAAABAQDPaTvMn1HIPU2DulP6hOJqKKF/7xpUDoSG0r/oGyFr8e6RGnmH3TM/HMAj5ero8iHZGfMqyAB7FOucootVS/TrwpHXy0B1UEQwqleBnA5OnMTDg5JCTgtV+srkTBDgCTsi9HxS5mYCze1sBpePvMwgLGe4WZSUwYKojzKNY49npKZ9sWuTUYdaPTbTTSVTPjyd1onW0VWjcwFxX9j9j90Hb6B89u3LYNAO9IpjZiKzy1oQky3l2kd8Agn6GPda3v5RvkMDW4223VDLFhrCifdYzdPQ1TGyWXWfQPBrBuVr4IUB68jDl6PHPQPCxvzrjJv3cqN3Y2310jf5IvwmEaVx",
#	}
}