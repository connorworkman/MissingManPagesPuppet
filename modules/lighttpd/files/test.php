<HTML><HEAD></HEAD><BODY>
 <?php echo $_SERVER['HTTP_HOST']; ?>
<?php $hostname = gethostbyaddr($_SERVER['REMOTE_ADDR']);
echo $hostname;
?>
</BODY></HTML>
