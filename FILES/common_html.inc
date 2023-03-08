<?php

// common html controls 
// (C)glebows@chemeng.p.lodz.pl
// 2004 m227

  function FCheckbox($name, $id="", $action="")
  {
  	return '    <INPUT TYPE="checkbox" NAME="'.$name.'" '.
  	       (!empty($id) ? 'ID="'.$id.'"' : '').
  	       ' VALUE="'.
  	       (isset($_REQUEST[$name]) ? '1" checked' : '0"').
  	       (!empty($action) ? " OnClick='$action';" : "").">";
  }

  function FCheckboxCol($captions, $id="", $action="")
  {
  	$ret = "";
  	for ($i=0; $i < count($captions); $i++)
  	  $ret .= FCheckbox($captions[$i], $id.$i, $action).$captions[$i]." <BR>\n";
  	return $ret;
  }


  function FEditText($name, $size="", $action="", $class="")
  {
    return '    <INPUT TYPE="text" NAME="'.$name.'" VALUE="'.REQUEST($name).'"'.
           (!empty($size) ? ' size="'.$size.'"' : '').
           (!empty($class) ? ' class="'.$class.'"' : '').
           (!empty($action) ? ' OnChange="'.$action.'"' : '').">\n";
  }

  function FEditDate($name, $size="", $action="")
  {
      return FEditText($name, $size, $action, 'date')."\n".
      FButton('subm', '...', '', "showCalendar(this,$name,'yyyy-mm-dd',null,1)",'date');
  }

  function FDateField($name="", $headers="",$layout="stack")
  {
  	if (empty($name)) 	  $name="data";
  	if (empty($headers))  $headers=array("data pocz¹tkowa","data koñcowa");
  	$res = "";

  	if ($layout=="vertical" || $layout=="stack")
  	  for ($i=0;$i<2;$i++)
  	    $res .=
  	       ($layout=="horizontal" ? "<TD>" : "").
  	        $headers[$i].($layout=="stack" || $layout=="horizontal" ? "<BR>" : "").
  	          FEditDate($name.($i+1),12).
  	       ($layout=="horizontal" ? "<TD>" : "<BR>");

    return $res;
  }

  function FButton($name, $value, $id, $action="", $class="")
  {
   	return '    <INPUT TYPE="button" NAME="'.$name.'" VALUE="'.$value.'" '.
       	   (isset($id) ? 'ID="'.$id.'"' : '').
       	   (!empty($class) ? ' class="'.$class.'"' : '').
           (!empty($action) ? ' OnClick="'.$action.'"' : '').">\n";
  }
  

  function RadioGroup($name, $captions, $default=0, $action="")
  {
  	$def = ( isset($_REQUEST[$name]) ? $_REQUEST[$name] : $default);
  	$ret = "";
  	for ($i=0; $i < count($captions); $i++)
  	  $ret .= '    <INPUT TYPE="radio" NAME="'.$name.'" value="'.$i.'" '.
  	          ( $def == $i ? 'checked' : '').
  	          (!empty($action) ? ' OnClick="'.$action.'"' : '')."> $captions[$i] <BR>\n";
  	return $ret;
  }

  function FSelect($name, $captions, $default="", $action="", $oneempty=FALSE, $class="")
  {
    //echo '<script>alert('.$class.');</SCRIPT>';
  	$def = ( isset($_REQUEST[$name]) ? $_REQUEST[$name] : $default);
  	$class = ($class == "" ? "" : "class = '$class'");
  	$ret= "    <SELECT $class name=\"".$name.'"'.(!empty($action) ? ' OnChange="'.$action.'"' : '').">\n";
  	if ($oneempty)
  	  $ret .= '   <OPTION VALUE=""></OPTION> ';

  	if (count($captions)>0)
  	  for ($i=0; $i < count($captions); $i++)
  	    $ret .= '      <OPTION VALUE="'.$captions[$i].'"'.
  	            ( $def == $captions[$i] ? ' selected' : '')."> $captions[$i] \n";

  	$ret .= "    </SELECT>\n";
  	return $ret;
  }

  // creates html dropdown box from query field
  //
  //
  function QueryToFSelect($sql, $name, $action="", $oneempty=TRUE, $class = "")
  {
  	$q = new queries;
  	$arr = $q->QueryFieldToArray($sql);
  	if (!is_array($arr)) settype($arr, "array");

  	return FSelect($name, $arr, "", $action, $oneempty, $class);
  }

  // works like QueryToFselect but automatically reloads page after select of any drop down box item
  // and adds to url that item value (name=value)
  //
  function QueryToFSelect2($sql, $name, $oneempty=true, $class = "", $addtourl = "")
  {
  	if ($addtourl == "")
	    return QueryToFSelect($sql, $name, "FilterRef('".$_SERVER['PHP_SELF']."?$name=',this)", $oneempty, $class);
	  else
	    return QueryToFSelect($sql, $name, "FilterRef('".$_SERVER['PHP_SELF']."?$addtourl&$name=',this)", $oneempty, $class);
  }

  function FieldToFSelect($tblfld, $name, $action='', $oneempty=true, $class = "", 
                           $distinct = true, $order = true, $addtourl = "")
  {
  	$t = explode ('.', $tblfld);
  	return QueryToFSelect(
  	
  	       'SELECT '.($distinct ? 'DISTINCT ' : '').$t[1].' FROM '.$t[0].
  	                 ($order ? ' ORDER BY '.$t[1] : ''),
  	
  	$name, $action, $oneempty, $class, $addtourl);
  }
    
  function FieldToFSelect2($tblfld, $name, $oneempty=true, $class = "", 
                           $distinct = true, $order = true, $addtourl = "")
  {
  	$t = explode ('.', $tblfld);
  	return QueryToFSelect2(
  	
  	       'SELECT '.($distinct ? 'DISTINCT ' : '').$t[1].' FROM '.$t[0].
  	                 ($order ? ' ORDER BY '.$t[1] : ''),
  	
  	$name, $oneempty, $class, $addtourl);
  }

  function HTMLtdQueryToFSelect($sql, $name, $action="", $oneempty=true, $addCount=false)
  {
  	return '<TH class="sml1">'.$name.'</TH><TD align="RIGHT">'.
  	       QueryToFSelect($sql, $name, $action, $oneempty).'</TD>';
  }

  function HTMLRowQueryToFSelect($sql, $name, $action="", $oneempty=true, $addCount=false)
  {
  	return '<TR>'.HTMLtdQueryToFSelect($sql, $name, $action, $oneempty, $addCount).
  	       '</TR>';
  }


  function AButton($caption, $href, $target="", $class="", $title="", $action="")
  {
	  if ($class == "") $class="button1";

	  return
	  "<table class='$class'><tr><td class='button'>\n".
	  '<A HREF="'.$href.
			  (!empty($target) ? '" TARGET="' .$target : '').
			  (!empty($title ) ? '" TITLE="'  .$title  : '').
			  (!empty($action) ? '" OnClick="'.$action : '').
	  '" class="sml2">'.$caption."</A>\n".
	  "</td></tr></table>\n";
  }

  function A2Button($name, $captions, $href, $target="", $class="", $title="", $action="")
  {
  	$tmp = explode(',',$captions);  	
  	if (!isset($_REQUEST[$name]))
  	  return AButton($tmp[0], $href.'?'.$name, $target, $class, $title, $action);
  	else
  	  return AButton($tmp[1], $href,           $target, $class, $title, $action);
  }

  function valid_name($str)
  {
  	$str = strtolower($str);
    $valid_chars = "abcdefghijklmnopqrstuvwxyz0123456789_";
    for ($i=0; $i < strlen($str); $i++)
      if (strpos($valid_chars, $str{$i}) === false)
        $str{$i} = '_';
    return $str;
  }


  function MButton($data)
  {
  	$res = " <table style='{text-align: center;	font-weight: bold;font-variant: small-caps; ".
					 "	font-style: normal;	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; ".
					 "	font-size: smaller;	}' cellspacing='2'>\n   <tr>\n";
  
  if (!is_array($data)) $data = array($data);
  for ($i=0; $i<count($data); $i++)
  {
    $tmp = explode('->', $data[$i]);
    if (empty($tmp[1])) $tmp[1] = $tmp[0].'.php';    
    $res .= '    <td style=\'{background-image: url(gfx/th_back.gif); padding: 1px 16px 1px 16px;	color: Black;	}\'>'.
            '      <A HREF=\''.$tmp[1].'\' style=\'{text-decoration: none; color: black;}\' >'.$tmp[0].'</A>'.
            '</td>'."\n";
  }
  $res .= "</tr></table>";
  return $res;
  }
  
  
?>
