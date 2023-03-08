<?php

//-------------------------------------------------------------------
//       
//       (C) 2004 Michal Glebowski
//       glebows@chemeng.p.lodz.pl
//       GG: 370979
//
//       use at your own risk! 
//-------------------------------------------------------------------

  require_once('common_html.inc');
  
  if (!isset($_REQUEST['printmode']))
    $grid->cornercontents = "<A title='print version' HREF = '".$_SERVER['PHP_SELF']."?printmode'><IMG SRC='gfx/print.gif' border='0' ALT=''></A>";
  else  
  {    
    $grid->can_add = FALSE;
    $grid->can_edit = FALSE;
    $grid->can_delete = FALSE;
    $grid->limit = 2000;
    $grid->can_filter = FALSE;
    $grid->can_sort = FALSE;
    $grid->can_navigate = FALSE;
  }
  
  if (isset($_REQUEST['printmode']))
  {
  	$grid->cornercontents = '<A title="return" style="font-size: 10px; color: red; background: none" HREF = "'.$_SERVER['PHP_SELF'].'">x</a>'; 

    // Fcheck fields contains also field nr cause now they can be doubled in table def.
  	$some_set = false;
  	foreach ($grid->columns as $key => $value)
  	  if (isset($_REQUEST[$value['field'].$key]))
  	    $some_set = true;
  	
  	if ($some_set == false) // none checked - check all
    	foreach ($grid->columns as $key => $value)
    	  $_REQUEST[$value['field'].$key] = 1;
  	
  	if (!isset($_REQUEST['hidepanel']))
  	{
  	  echo '<table><tr><td>';
      echo '<form>';     
      echo '<table style="font-size: 10px; color: black; background: #aaaa66; border-color: #aa8822; border-style: solid;">'.
           '<tr><th>&nbsp;</th><th>select columns</th></tr>';
      foreach ($grid->columns as $key => $value)      
        echo '<tr><td>'.FCheckbox($value['field'].$key).(isset($value['caption']) ? $value['caption'] : $value['field']).
             '</td></tr>';

      echo '<td>&nbsp;</td>'.
           '<th><INPUT style="font-size: 10px; color: blue" TYPE="submit" VALUE="use">'.
           '<INPUT style="font-size: 10px; color: #002222" TYPE="submit" name="hidepanel" VALUE="hide panel"></th>'.
           '<input type="hidden" name="printmode"></table>'.
           '</form>';
      echo '</td><td valign="top">'.
           "<IMG SRC='gfx/print.gif' border='0'>".
           '<span style="font-size: 14px; font-weight: bold; color: black;">wydruk tabeli</span><BR>'.
           '<span style="font-size: 11px; color: brown;"> '.
             'printed table will be filtered and sorted in the way it was done in edit mode,<BR>'.
             'the \'x\' sign i left corner of the table returns to edit mode.'.
           '</span>'.
           '</td></tr></table>';
    }
      
    $vals=array_values($grid->columns);
    for ($i=count($grid->columns)-1; $i > 0 ; $i--)    
      if (!isset($_REQUEST[$vals[$i]['field'].$i]))
        array_splice($grid->columns, $i,1);
          
  }

?>
