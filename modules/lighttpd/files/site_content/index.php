<HTML>
<HEAD>
<TITLE>The Missing Man Pages</TITLE>
<STYLE>
hr { display: block; height: 1px;
	border: 0; border-top: 1px solid;
	margin: 1em 0; padding: 0; margin: 0 auto;}
</STYLE>
</HEAD>
Welcome to...<hr>
<BODY bgcolor="black" TEXT="white" LINK="yellow" VLINK="839590" STYLE="width: 85%; margin: 0 auto;">
<p alight="left"><font color="red" size=5>
The Missing Man Pages - Load Balanced HTTP Server</font></p>
<font face="arial">
 <p>This page may be served by either Joey's or Connor's machine.</p>
 <p><img src="./mmp.gif" alt="MMP"></p>

 <?php
  $hostname=gethostname();

  switch ($hostname) {
   case "ip-10-0-4-226":
    $instance_name="Connor";
    break;
   case "ip-10-0-4-27";
    $instance_name="Joey";
    break;
   default:
    $instance_name="someone else (this shouldn't happen)";
    break;
   }

   echo "Owner of the instance serving this page: $instance_name"
 ?>
</font>
</BODY>
</html>
