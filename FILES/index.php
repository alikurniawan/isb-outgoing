<html>
<head>
<style>
.back {
  azimuth:center;
  background-image:url('images/index_04.gif');
  width:87; /* or whatever */
  height:38; /* or whatever */
  background-repeat:	no-repeat;
  background-color:	transparent;
  border:			none;
  text-indent:		-999em;
}
</style>

<html>
<head>
<title>Surat Keluar</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<center>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<!-- Tapal Batas (index2.psd) -->
<!--<form method="post" action="<?php print $_SERVER['PHP_SELF']; ?>">-->
<table id="Table_01" width="1280" height="768" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="2" background="panzer_tank/index_01.gif" width="1280" height="131">&nbsp;</td>
	</tr>
	<tr>
		<td>
			<img src="panzer_tank/index_02.gif" width="87" height="5" alt=""></td>
		<td rowspan="2" background="panzer_tank/index_03.gif" width="1193" height="43">&nbsp;</td>
	</tr>
	
	<tr>
		<td background="panzer_tank/index_04.gif" width="87" height="38">
        
       <table width="87" height="38" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td>
    <form method="post" action="<?php print $_SERVER['PHP_SELF']; ?>">
    <table width="87" height="38" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td><button type="submit" name="back" class="back"/></td>
  </tr>
</table>
	</form>
    </td>
  </tr>
</table>

        </td>
	</tr>
	
	<tr>
		<td colspan="2" background="panzer_tank/index_05.gif" width="1280" height="576">
		<?php
			if(isset($_POST['back']))
			{
				echo "<script>"."window.location = 'http://192.168.0.99/index.php'"."</script>";
			}
			include'panzer_tank/cabin.php';
		?>
		</td>
	</tr>
	<tr>
		<td colspan="2" background="panzer_tank/index_06.gif" width="1280" height="18">&nbsp;</td>
	</tr>
</table>
<!--</form>-->
<!-- End Save for Web Slices -->
</body>
</center>
</html>


