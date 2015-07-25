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

<?php $hostname = gethostbyaddr($_SERVER['REMOTE_ADDR']);
echo $hostname;
if ($hostname == "ip-10-0-4-29.us-west-2.compute.internal\n") {
        echo "This is served from Connor's instance.\n";
} else {
    echo "This is served from Joey's instance.\n";
}
?>

</font>
</BODY>
</html>
