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
    $instance_name="<a href=\"http://ec2-52-27-147-194.us-west-2.compute.amazonaws.com/\">Connor</a>";
    break;
   case "ip-10-0-4-27";
    $instance_name="<a href=\"http://ec2-52-10-243-147.us-west-2.compute.amazonaws.com/\">Joey</a>";
    break;
   default:
    $instance_name="someone else (this shouldn't happen)";
    break;
   }

   echo "Owner of the instance serving this page: $instance_name"
?>

For MissingManPagesMail (RoundCube) Support, contact connor@ec2-52-27-147-194.us-west-2.compute.amazonaws.com<br>
For MissingManPagesMail account creation, send a request with desired username to connor@ec2-52-27-147-194.us-west-2.compute.amazonaws.com<br>
</font>
</BODY>
</html>
