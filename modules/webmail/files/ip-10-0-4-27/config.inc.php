<?php

/* Local configuration for Roundcube Webmail */

// ----------------------------------
// SQL DATABASE
// ----------------------------------
// Database connection string (DSN) for read+write operations
// Format (compatible with PEAR MDB2): db_provider://user:password@host/database
// Currently supported db_providers: mysql, pgsql, sqlite, mssql or sqlsrv
// For examples see http://pear.php.net/manual/en/package.database.mdb2.intro-dsn.php
// NOTE: for SQLite use absolute path: 'sqlite:////full/path/to/sqlite.db?mode=0646'


//$config['db_dsnr'] = 'mysql://roundcube:incorrecthorsebatterystaple@localhost/roundcubemail';
$config['db_dsnw'] = 'mysql://roundcube:hn2fx88f4@10.0.4.230/roundcubemail';

// ----------------------------------
// IMAP
// ----------------------------------
// The mail host chosen to perform the log-in.
// Leave blank to show a textbox at login, give a list of hosts
// to display a pulldown menu or set one host as string.
// To use SSL/TLS connection, enter hostname with prefix ssl:// or tls://
// Supported replacement variables:
// %n - hostname ($_SERVER['SERVER_NAME'])
// %t - hostname without the first part
// %d - domain (http hostname $_SERVER['HTTP_HOST'] without the first part)
// %s - domain name after the '@' from e-mail address provided at login screen
// For example %n = mail.domain.tld, %t = domain.tld
// WARNING: After hostname change update of mail_host column in users table is
//          required to match old user data records with the new host.
//$config['default_host'] = '10.0.4.226';

// provide an URL where a user can get support for this Roundcube installation
// PLEASE DO NOT LINK TO THE ROUNDCUBE.NET WEBSITE HERE!
//$config['support_url'] = 'http://missingmanpages-1289965409.us-west-2.elb.amazonaws.com/';

// automatically create a new Roundcube user when log-in the first time.
// a new user will be created once the IMAP login succeeds.
// set to false if only registered users can use this service
$config['auto_create_user'] = true;

// this key is used to encrypt the users imap password which is stored
// in the session record (and the client cookie if remember password is enabled).
// please provide a string of exactly 24 chars.
$config['des_key'] = '928xd121xd934d49b11c3fxd';


//enable these for memcaching session data
//$config['session_storage'] = 'memcache';
//$config['memcache_hosts'] = array( 'localhost:11211', '10.0.4.230:11211', '10.0.4.226:11211');




// Name your service. This is displayed on the login screen and in the window title
$config['product_name'] = 'MissingManPagesMail';

// ----------------------------------
// PLUGINS
// ----------------------------------
// List of active plugins (in plugins/ directory)
$config['plugins'] = array();

// skin name: folder from skins/
$config['skin'] = 'classic';

// save compose message every 300 seconds (5min)
$config['draft_autosave'] = 60;

