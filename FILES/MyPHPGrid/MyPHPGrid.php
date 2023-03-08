<?php

//-------------------------------------------------------------------
//       MyPHPGrid.php v1.00
//
//       (C) 2004-2006 Michal Glebowski
//       glebows@chemeng.p.lodz.pl
//
//       licence: MPL1.1
//       functionality: full
//
//       use at your own risk!
//       look at docs/MyPHPGrid.txt for more information
//-------------------------------------------------------------------

// history of public releases:
//
// 2004 10 28 - 0.91
//      added next plus sign to allow inserting new record with
//      defaults like last one added
//

// 2005 08
//
//      changed unlimited length of table from -1 to 18446744073709551615
//      (LIMIT 0,n) cause it did not work in new MySQL version 4.1
//
//

// 2005 10
//
//      added 'can_edit' property to columns (use with 'default' property
//        when adding new record)
//
//      added filter_size property to cover size property for filters
//
//      added 'charset' property to change charset when executing queries...
//
//
//      added 'default' property to set default value for column when adding record
//
//      border removed for icon of action(fix)
//
//      added 'visible' property to columns
//
//      fixed 'FEditPass no parameter 6 error'
//
//      added 'cipherPass' global property (default false to backward compatibility)
//        to md5 hash passes before writing to database
//

// 2005 12 - line 1097 'filer' -> 'filter' fix
//
//		  hidden column (field) with default value set passes that value through
//        add add edit modes.
//
//      $this->can_navigate -> if false - no navigator is drawn
//
// 2006 01 - get_parsed_value - helper function to parse data came from before/after _ add/edit/delete
//
//           is_unique - helper function to help if a record with the same value of a field is found
//
// 2006 02 - fixed date field in edit mode to fit in one line
//         - fixed the height of filter row to the same in edit and view mode
//
//


// to obtain backward compatibility with MySQLGrid component

class MySQLGrid extends MyPHPGrid {}

if (!defined('PHPMYSQLGRID_TEXT'))
{
  define("PHPMYSQLGRID_TEXT", 0);
  define("PHPMYSQLGRID_BOOLEAN", 1);
  define("PHPMYSQLGRID_LOOKUP", 2);
  define("PHPMYSQLGRID_PASSWORD", 3);
  define("PHPMYSQLGRID_SELECTION", 4);
  define("PHPMYSQLGRID_MULTILINETEXT", 5);
  define("PHPMYSQLGRID_FILE", 6);
  define("PHPMYSQLGRID_NONE", 9);

  define("PHPMYSQLGRID_VIEWMODE", 0);
  define("PHPMYSQLGRID_ADDMODE", 1);
  define("PHPMYSQLGRID_EDITMODE", 2);
  define("PHPMYSQLGRID_DELETEMODE", 3);

  define("PHPMYSQLGRID_TEXTBUTTON", 0);
  define("PHPMYSQLGRID_IMAGEBUTTON", 1);

  define("PHPMYSQLGRID_PWDUMMY", "********");
}

// ***

class MyPHPGrid
{
  function MyPHPGrid()
  {

    $this->hostname = ""; // "localhost";
    $this->port = 3128;
    $this->username = ""; // "root";
    $this->password = "";//"kbri2005";
    $this->database = "";

    $this->table = "";
    $this->primary = "";
    $this->style = "";
    $this->columns = array();
    $this->actions = array();
    $this->caption = "";

    $this->limit = 20;
    $this->limits = "10,20,40,18446744073709551615";
    $this->name = "myphpgrid";
    $this->can_add =      true;
    $this->can_delete =   false;
    $this->can_edit =     true;

    $this->can_navigate = true;
    $this->can_sort =     true;
    $this->can_filter =   true;

    $this->persistent = false;

    $this->pass_str   = '********';
		$this->cipherPass = false;

    $this->filter= array();
    $this->fltr= array();  // internal

    $this->page = 0;
    $this->sort = 0;
    $this->default_sort_column = 0; // for backward compatibility

    $this->bool1 = 'Y';
    $this->bool0 = 'N';

    $this->auth_file = 'auth_data.php';
    $this->do_full_page = false; // true
    $this->wrap = 'NOWRAP';
    $this->printmode = false;
    $this->cornercontents = '';
    $this->nav_pictures = true;
    $this->nav_pic_dir = '';
    $this->json = true; // java script enabled
    $this->global_rights = 'mode'; //$_SESSION[..]=> (R/RW)
    $this->onload = ''; // js event to trigger when reloading page (only when do_full_page set)

    $this->custom_header = '<h2 class=\n"myphpgrid\n">Agenda Surat Keluar</h2>  Format Kode Bidang (/Kodebidang/ISL/bulan/tahun) Contoh: /PK/ISL/I/15';
    //$this->custom_header = '<h3 class=\n"myphpgrid\n">Format Kode Bidang (/Kodebidang/ISB/bulan/tahun) Contoh /PK/ISB/I/12 </h3>';
    $this->custom_footer = '';

    // hooks
    $this->before_add = '';
    $this->before_edit = '';
    $this->before_delete = '';
    $this->after_add = '';
    $this->after_edit = '';
    $this->after_delete = '';
  }

  //
  // taken from my common_html.php (slightly changed)
  //

  function Request($val)
  {
    return (isset($_REQUEST[$val]) ? $_REQUEST[$val] : "");
  }

  function FEditTextArea($name, $action="", $class="", $rows='', $cols='', $style='')
  {
    return '    <TEXTAREA NAME="'.$this->name.'_'.$name.'"'.
           (!empty($class)  ? ' class="'.$class.'"'     : '').
           (!empty($rows)   ? ' rows="'.$rows.'"'       : '').
           (!empty($cols)   ? ' cols="'.$cols.'"'       : '').
           (!empty($style)  ? ' style="'.$style.'"'     : '').
           (!empty($action) ? ' OnChange="'.$action.'"' : '').
           '>'.
             $this->ReqSes($name).
           "</TEXTAREA>\n";
  }

  function FEditPass($name, $size="", $action="", $class="", $maxlength='', $style='')
  {
    return $this->FEditText($name, $size, $action, $class, $maxlength, $style, 'password');
  }

  function FEditFile($name, $size="", $action="", $class="", $maxlength='', $style)
  {
    return $this->FEditText($name, $size, $action, $class, $maxlength, $style, 'file');
  }

  function FEditText($name, $size="", $action="", $class="", $maxlength='', $style='' , $type="text")
  {
    return '    <INPUT TYPE="'.$type.'" NAME="'.$this->name.'_'.$name.'" VALUE="'.$this->ReqSes($name).'"'.
           (!empty($size)      ? ' size="'.$size.'"'       : '').
           (!empty($maxlength) ? ' maxlength="'.$maxlength.'"' : '').
           (!empty($class)     ? ' class="'.$class.'"'     : '').
           (!empty($style)     ? ' style="'.$style.'"'     : '').
           (!empty($action)    ? ' OnChange="'.$action.'"' : '').">\n";
  }

  function FSelectMaxArr ($name,
              $arr,

                          $action='',
                          $oneempty=true,
                          $class = "",
                          $refresh = false)
  {

    if (!is_array($arr)) settype($arr, "array");

    $def = $this->ReqSes($name);
    $name = $this->name.'_'.$name;

    $class = ($class == "" ? "" : "class = '$class'");

    if ($refresh)
    $action = "FilterRef('".$_SERVER['PHP_SELF']."?$name=',this)";

    $ret= "\n    <SELECT $class name=\"".$name.'"'.(!empty($action) ? ' OnChange="'.$action.'"' : '').">\n";
    if ($oneempty)
      $ret .= "   <OPTION VALUE=\"\"></OPTION>\n";

    if (count($arr)>0)
      for ($i=0; $i < count($arr); $i++)
        $ret .= '      <OPTION VALUE="'.$arr[$i][0].'"'.
                ( $def == $arr[$i][0] ? ' selected' : '')."> ".$arr[$i][1]." \n";

    $ret .= "    </SELECT>\n";
    return $ret;
  }


  function FSelectMax    ($name,
                          $lookup_table,
                          $lookup_primary,
                          $lookup_field,

                          $action='',
                          $oneempty=true,
                          $class = "",
                          $distinct = true,
                          $order = true,
                          $refresh = false)
  {

    $sql = 'SELECT '.($distinct ? 'DISTINCT ' : '').$lookup_primary.', '.$lookup_field.
           ' FROM '.$lookup_table.
           ($order ? ' ORDER BY '.$lookup_field : '');

    $arr = $this->db_QueryToArray($sql);
    return $this->FSelectMaxArr ($name, $arr, $action, $oneempty, $class, $refresh);
  }


 // ***

  function field_property($fieldid, $property)
  {
    if (isset($this->columns[$fieldid][$property]))
      $result = $property.'=\''.$this->columns[$fieldid][$property].'\'';
    else
      $result = '';

    return $result;
  }


  function set_captions()
  {
    for ($i = 0; $i < count($this->columns); $i++)
    {
      if (!isset($this->columns[$i]['type'])) $this->columns[$i]['type'] = 'text';

      if (!isset($this->columns[$i]['caption']))
                 $this->columns[$i]['caption'] = $this->columns[$i]['field'];

      if (!isset($this->columns[$i]['can_sort'])) $this->columns[$i]['can_sort'] = true;
      if (!isset($this->columns[$i]['can_filter'])) $this->columns[$i]['can_filter'] = true;

    }
  }

  function set_rights()
  {
    if ($this->global_rights != '' && isset($_SESSION[$this->global_rights]))
    {
      $write = strpos(strtoupper($_SESSION[$this->global_rights]), 'W');
      $this->can_add =    $write;
      $this->can_delete = $write;
      $this->can_edit =   $write;
    }
  }

  function initialize()
  {
    $this->set_captions();

    $this->convert_types_from_mysqlgrid();

    $this->set_rights();

    if ($this->caption == "") $this->caption = $this->table;

    //pictures (optional)

    if ($this->nav_pictures)
    {
      if ($this->nav_pic_dir == '') $this->nav_pic_dir = './MyPHPGrid/images/';

    }
    // captions
    $this->nav_frst = "[|<]";        $this->nav_frsth = "pertama";
    $this->nav_prev = "[<<]";        $this->nav_prevh = "sebelum";
    $this->nav_next = "[>>]";        $this->nav_nexth = "berikut";
    $this->nav_last = "[>|]";        $this->nav_lasth = "terakhir";

    $this->nav_add  = "[+]";         $this->nav_addh  = "tambah record";
    $this->nav_edt  = "[e]";         $this->nav_edth  = "edit record";
    $this->nav_del  = "[-]";         $this->nav_delh  = "hapus record";

    $this->nav_ad2  = "[*]";         $this->nav_ad2h  = "tambah record template";

    $this->nav_acc  = "[*]";         $this->nav_acch  = "confirm";
    $this->nav_cnc  = "[&lt;]";      $this->nav_cnch  = "cancel";

    $this->nav_nof  = "[-]";         $this->nav_nofh  = "filter";

    $this->nav_wrap0 = "&raquo;&laquo;";  $this->nav_wrap0h = "wrap";
    $this->nav_wrap1 = "&laquo;&raquo;";  $this->nav_wrap1h = "standard";

    $this->nav_limitsh  = 'record per halaman';
    $this->nav_nameh    = 'nama tabel';
    $this->nav_recordsh = 'record';
    $this->nav_selpageh = 'halaman';
    $this->nav_printmodeh = 'tampilan cetak';

    $this->nav_sort = 'urut';

    $this->js = <<<EOD

    <SCRIPT language="javascript" type="text/javascript">
    <!-- -->
    function FilterRef(Link, SelectList)
    {
      url = SelectList.options[SelectList.selectedIndex].value;
      window.location.href = Link + url;
    }

    function SP(row, action, dcolor)
    {
      cells = row.cells;

      var a = cells[0].innerHTML.toLowerCase();
      b = a.indexOf('href')+6;
      c = a.indexOf('"',b+4);
      url = a.substring(b,c);

      if (action=='over') color = '#D5F5A5';
      if (action=='out')  color = row.id;
      if (action=='down' && url != '') document.location.href = url;

      if (action=='over' || action=='out')
      {
        row.id = cells[0].style.backgroundColor;
        for (c = 0; c < cells.length; c++)
          cells[c].style.backgroundColor = color;
      }
    }

    </SCRIPT>
    <script type="text/javascript" language="JavaScript" src="popcal2/popcalendar.js"></script>
EOD;

    $this->html_header = <<<EOD
<!--!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//PL"
   "http://www.w3.org/TR/html4/loose.dtd"-->
   
<html>
  <head>
    <meta http-equiv=Content-Type content="text/html; charset=Windows-1250">
    <link rel="stylesheet" href="myphpg.css" />
    <link rel="stylesheet" href="./MyPHPGrid/myphpg.css" />
    <title>Agenda Surat Keluar</title>
EOD;
  $this->html_header .= $this->js. <<<EOD
  </head>
EOD;
    $this->html_header .= "\n  <body BGCOLOR=white ".($this->onload !='' ? ' onLoad="'.$this->onload.'"': '').">";
    $this->html_footer = <<<EOD
  </body>
</html>
EOD;

  }

  function convert_types_from_mysqlgrid()
  {
    for ($i = 0; $i < count($this->columns); $i++)
      if (!is_string($this->columns[$i]['type']))
        switch ($this->columns[$i]['type'])
        {
          case 0 :  $this->columns[$i]['type'] = 'text';            break;
          case 1 :  $this->columns[$i]['type'] = 'boolean';         break;
          case 2 :  $this->columns[$i]['type'] = 'lookup';          break;
          case 3 :  $this->columns[$i]['type'] = 'password';        break;
          case 4 :  $this->columns[$i]['type'] = 'selection';       break;
          case 5 :  $this->columns[$i]['type'] = 'multiline';       break;
          case 6 :  $this->columns[$i]['type'] = 'file';            break;
          case 9 :  $this->columns[$i]['type'] = 'none';            break;
        }

    for ($i = 0; $i < count($this->actions); $i++)
      switch ($this->actions[$i]['type'])
      {
        case 0 :  $this->actions[$i]['type'] = 'text';     break;
        case 1 :  $this->actions[$i]['type'] = 'image';    break;
      }


  }

  function show_array($name)
  {
    for ($i = 0; $i < count($name); $i++)
    {
      $a = array_keys($name);
      echo $a[$i].' = '.$name[$a[$i]].' ||| ';
    }
    echo "<BR><BR>";
  }

  function show_session_data($all = false)
  {
    for ($i = 0; $i < count($_SESSION); $i++)
    {
      $a = array_keys($_SESSION);
      if (substr($a[$i],0,strlen($this->name))==$this->name || $all)
        echo $a[$i].' = '.$_SESSION[$a[$i]].'<BR>';
    }
  }

  function reset_session_data()
  {
    for ($i = count($_SESSION)-1; $i >= 0; $i--)
    {
      $a = array_keys($_SESSION);
      if (substr($a[$i],0,strlen($this->name))==$this->name)
        unset($_SESSION[$a[$i]]);
    }
  }

  function reset_filter_data()
  {
    for ($i = 0; $i < count($this->columns); $i++)
    {
      $req = $this->name.'_filter'.$i;
      if (isset($_REQUEST[$req])) unset($_REQUEST[$req]);
      if (isset($_SESSION[$req])) unset($_SESSION[$req]);
    }
  }

  function ReqSes($varname, $default='')
  {
    $varname = $this->name.'_'.$varname;

    if (isset($_REQUEST[$varname]))
    {
       $_SESSION[$varname] = $_REQUEST[$varname];
       return $_REQUEST[$varname];
    }
    else
    {
      if (isset($_SESSION[$varname]))
        return $_SESSION[$varname];
      else
        return $default;
    }
  }

  function reparse_filter_backward($str)
  {
        $fl = explode('=',$str);
        $p = strpos($fl[0], '.');
        if ($p>0) $fl[0] = trim(substr($fl[0], $p+1));
        $fl[1] = trim($fl[1], ' \'"');
        return $fl;
  }

    //-------------------------------------------------------------------------
    //
    //  PARSE REQUESTS
    //
    //-------------------------------------------------------------------------

  function parse_requests()
  {

    // this policy gives ability to remember settings of last visited page containing grid
    if (!isset($_SESSION[$this->name.'_url']))
       $this->reset_session_data();
    else
      if ($_SESSION[$this->name.'_url'] != $_SERVER['PHP_SELF']) // page changed
        $this->reset_session_data();

    // check if any filter has changed, if so set page to 1
    for ($i = 0; $i < count($this->columns); $i++)
      if (isset($_REQUEST[$this->name.'_filter'.$i]))
        $_REQUEST[$this->name.'_page'] = 1;


    if (isset($_REQUEST['temp_clear_filter'])) $this->reset_filter_data();

    for ($i = 0; $i < count($this->columns); $i++)
      $this->fltr[$i] = $this->ReqSes('filter'.$i);

    // edit id for backward compatibility ;)
    if (isset($_REQUEST['phpmysqlgrid_editid'])) $_REQUEST['tmp_'.$this->name.'_edit'] = $_REQUEST['phpmysqlgrid_editid'];

    $this->page = $this->ReqSes('page',1);
    $this->sort = $this->ReqSes('sort',$this->default_sort_column);
    $this->sord = $this->ReqSes('sord','D');

    $this->printmode = $this->ReqSes('printmode',false);

    $this->wrap = $this->ReqSes('wrap','NOWRAP');

    $this->limit = $this->ReqSes('limit', $this->limit);

    $this->editid = isset($_REQUEST['tmp_'.$this->name.'_edit'])   ? $_REQUEST['tmp_'.$this->name.'_edit'] : '';
    $this->delid =  isset($_REQUEST['tmp_'.$this->name.'_delete']) ? $_REQUEST['tmp_'.$this->name.'_delete'] : '';
    $this->addid =  isset($_REQUEST['tmp_'.$this->name.'_add'])    ? $_REQUEST['tmp_'.$this->name.'_add'] : '';

    // remember last selected page to delete all session data if it changes
    $_SESSION[$this->name.'_url'] = $_SERVER['PHP_SELF'];

    //$this->show_session_data(true);
    //$this->show_array($_REQUEST);

    if (isset($_REQUEST[$this->name.'_edited']))  $this->parse_edited($_REQUEST[$this->name.'_edited']);
    if (isset($_REQUEST[$this->name.'_deleted'])) $this->parse_deleted($_REQUEST[$this->name.'_deleted']);
    if (isset($_REQUEST[$this->name.'_added']))   $this->parse_added($_REQUEST[$this->name.'_added']);

  }

  function record_to_memory_for_future_use() // (2004 10 28)
  {
    $buffer_rec = array();
    for ($i = 0; $i < count($this->columns); $i++)
    {
      $req = $this->name.'_e'.$i;
      $val = isset($_REQUEST[$req]) ? $_REQUEST[$req] : '';
      $buffer_rec[] = $val;
    }
    $_SESSION[$this->name.'_buffered_record'] = implode('&&', $buffer_rec);
  }


  function parse_form()
  {
    $fld = array();
    for ($i=0; $i < count($this->columns); $i++)
    {
      $req = $this->name.'_e'.$i;

      if (isset($_REQUEST[$req]))
      {
        $val = $_REQUEST[$req];

        if ($this->columns[$i]['type']=='password' && $this->cipherPass)
          $val = md5($val);

	      switch ($this->columns[$i]['type'])
	      {
	      case 'none' :
	        break;
	      case 'lookup' :
	        $fld[] = $this->columns[$i]['field'].' = "'.$val.'"';
	        break;
	      default :
	        $fld[] = $this->columns[$i]['field'].' = "'.$val.'"';
	      }
      }
    }
    return implode(',', $fld);
  }

  function parse_edited($id)
  {
    $hook = $this->before_edit;
    if (is_callable($hook)) if (!$hook($this, $id, $this->parse_form())) return;

    $sql = 'UPDATE '.$this->table.' SET '.$this->parse_form().' WHERE '.$this->primary.' = '.$id;
    $this->db_query($sql);

    $hook = $this->after_edit;
    if (is_callable($hook)) if (!$hook($this, $id, $this->parse_form())) return;
  }

  function parse_deleted($id)
  {
    $hook = $this->before_delete;
    if (is_callable($hook)) if (!$hook($this, $id, $this->parse_form())) return;

    $sql = 'DELETE FROM '.$this->table.' WHERE '.$this->primary.' = '.$id;
    $this->db_query($sql);

    $hook = $this->after_delete;
    if (is_callable($hook)) if (!$hook($this, $id, $this->parse_form())) return;

  }

  function parse_added($id)
  {
  	$this->record_to_memory_for_future_use(); // add added record to buffer (2004 10 28)

    $hook = $this->before_add;
    if (is_callable($hook)) if (!$hook($this, $id, $this->parse_form())) return;

    $sql = 'INSERT INTO '.$this->table.' SET '.$this->parse_form();
    $this->db_query($sql);

    $hook = $this->after_add;
    if (is_callable($hook)) { $id = mysql_insert_id(); if (!$hook($this, $id, $data)) return; }

  }

  function get_parsed_value($data, $pos)
  {
  	$arr = explode(',', $data);
  	$arr = explode('=', $arr[$pos]);
  	return substr($arr[1],2,-1);
  }

  function check_unique($value, $pos) // count repetitions
  {
  	 return mysql_num_rows($this->db_query(
  	        sprintf('SELECT * FROM %s WHERE %s = "%s"',
  	        $this->table, $this->columns[$pos]['field'], $value)));
  }

  function is_unique($v, $p)
  {
  	return $this->check_unique($this->get_parsed_value($v, $p), $p) == 0;
  }


    //-------------------------------------------------------------------------
    //
    //  DATABASE INTERFACE
    //
    //-------------------------------------------------------------------------

    function connect() { $this->db_connect(); }       // backward compatibility
    function disconnect() { $this->db_disconnect(); } // backward compatibility

    function db_connect()
    {
        if ($this->auth_file)
        {
            include($this->auth_file);
            if ($this->hostname == '')  $this->hostname= $_hostname;
            if ($this->username == '')  $this->username= $_username;
            if ($this->password == '')  $this->password= $_password;
            if ($this->database == '')  $this->database= $_database;
        }

        $connect = 'mysql_'.($this->persistent ? 'p' : '').'connect';
        $this->db = $connect($this->hostname, $this->username, $this->password);

        if (!$this->db) die();
        if (!mysql_select_db($this->database, $this->db))
            trigger_error(mysql_error(), E_USER_ERROR);

				if (isset($this->charset) && $this->charset)
				  mysql_query("SET CHARACTER SET ".$this->charset.";", $this->db); //  to have Polish characters in my database shown (utf8)
    }

    function db_disconnect()
    {
        mysql_close($this->db);
    }

    function db_query($query)
    {
        $result = mysql_query($query, $this->db);
        if (!$result)
        {
        	  echo "<STRONG>$query</STRONG><BR><BR>";
            trigger_error(mysql_error(), E_USER_ERROR);
        }
        //$data = mysql_fetch_row($result);
        //mysql_free_result($result);
        return $result;
    }

    function db_numrows($table)
    {
      $filter = $this->get_filter();
      $result = $this->db_query("SELECT * FROM $table ".(!empty($filter)    ? $filter.' ' : ''));
      return mysql_num_rows($result);
      //mysql_free_result($result);
    }

    function db_lookup($fieldnr, $id)
    {
      $field = $this->columns[$fieldnr];
      $r = $this->db_query('SELECT '.$field['lookup_field'].
                           ' FROM '. $field['lookup_table'].
                           ' WHERE '.$field['lookup_primary'].' = "'.$id.'"');
      $row = mysql_fetch_row($r);
      return $row[0];
    }

    function db_QueryToArray($sql)
    {
      $ret=array();
      if (!empty($sql))
      {
        $result = $this->db_query($sql);

        while ($row = mysql_fetch_row($result))
          $ret[] = $row;

        mysql_free_result($result);
      }
      return $ret;
    }


  function start_table()
  {
	echo "\n    <FORM name='".$this->name."_form' ACTION=''>".
         "\n    <TABLE class='myphpgrid' border='0' cellspacing='1'>\n";
  }

  function end_table()
  {
    echo "      </TABLE>\n".
         "      <input type=\"image\" width=\"0\" height=\"0\" alt=\"\">\n".
         "      </FORM>\n";
  }


          //--------------------------------------------------------------------------------
          //  DRAW HEADER
          //--------------------------------------------------------------------------------

  function draw_header()
  {
    echo "      <TR>\n";

    if (!$this->printmode)
      echo '        <TH CLASS=\'myphpgrid\' WIDTH=\'36\'>'.
            ($this->can_add ?
              $this->hint_href('nav_add', $_SERVER['PHP_SELF'].'?tmp_'.$this->name.'_add=-1', 'myphpgrid_add').
              $this->hint_href('nav_ad2', $_SERVER['PHP_SELF'].'?tmp_'.$this->name.'_add=-2', 'myphpgrid_add')
              //$this->hint_href('nav_ad2', $_SERVER['PHP_SELF'].'?'.$_SERVER['QUERY_STRING'], 'myphpgrid_add')
              : '').
           '</TH>';
    else
    echo '        <TH CLASS=\'myphpgrid\'></TH>';

    for ($i = 0; $i < count($this->columns); $i++)
    {
      $width = $this->field_property($i, 'width');
      $hdr = $this->columns[$i]['caption'];

      if ($this->can_sort && $this->columns[$i]['can_sort'])
      {
        $style=($this->sort != $i ? '' : $this->sord);
        $ad =  ($this->sort != $i || $this->sord != 'A' ? 'A' : 'D');

        $hdr = '<A CLASS=\'myphpgrid'.$style.'\''.
                 ' TITLE=\''.$this->nav_sort.' ['.$this->columns[$i]['caption'].']\''.
                 ' HREF =\''.$_SERVER['PHP_SELF'].'?'.$this->name.'_sort='.$i.
                                                  '&'.$this->name.'_sord='.$ad.'\'>'.
               $this->columns[$i]['caption'].'</A>';
      }

      if (!isset($this->columns[$i]['visible']) || $this->columns[$i]['visible'])
      echo "        <TH class='myphpgrid".
                    ($this->sort == $i ? '_sorted' : '')."' $width ".$this->wrap.">".$hdr."</TH>\n";
    }
    echo "      </TR>\n";
  }

          //--------------------------------------------------------------------------------
          //  DRAW OPTIONS
          //--------------------------------------------------------------------------------

  function draw_options($row, $record_id, $mode)
  {
    $url= $_SERVER['PHP_SELF'].'?tmp_'.$this->name;

    echo "        <TH CLASS='myphpgrid' NOWRAP>";

    if ($this->printmode){
      echo "</TH>\n";
      return;
    }

    if ($mode=='view')
    {
      echo
      ($this->can_edit   ? $this->hint_href('nav_edt', $url.'_edit='.  $record_id, 'myphpgrid_edit') : '').
      ($this->can_delete ? $this->hint_href('nav_del', $url.'_delete='.$record_id, 'myphpgrid_del') : '');

      if (!empty($this->actions))
        foreach ($this->actions AS $val)
        {
          if (empty($val['url'])) $val['url'] = $_SERVER['PHP_SELF'];
          if (empty($val['caption'])) $val['caption'] = $val['url'];

          $url     = str_replace("<ID>", $record_id, $val['url']);
          $caption = str_replace("<ID>", $record_id, $val['caption']);
          $title   = isset($val['title']) ? ' TITLE = "'.$val['title'].'" ' : '';
          $alt     = isset($val['alt']) ? $val['alt'] : '';

          switch ($val['type'])
          {
          case 'text' :
            echo '<A HREF = "'.$url.'" '.$title.'>'.$caption.'</A>';
            break;
          case 'image' :
            echo '<A HREF = "'.$url.'" '.$title.'><img src="'.$caption.'" border="0" alt="'.$alt.'" '.$title.'></A>';
            break;
          }
        }



    }
    if ($mode=='edit' || $mode=='del' || $mode == 'add')

      echo " <A NAME=\"editrec\">".

      ($mode == 'edit' ? '<INPUT TYPE="hidden" NAME="'.$this->name.'_edited"  VALUE="'.$record_id.'">' : '').
      ($mode == 'del'  ? '<INPUT TYPE="hidden" NAME="'.$this->name.'_deleted" VALUE="'.$record_id.'">' : '').
      ($mode == 'add'  ? '<INPUT TYPE="hidden" NAME="'.$this->name.'_added"   VALUE="'.$record_id.'">' : '').


      '<SPAN CLASS=\'myphpgrid_acc\' TITLE=\''.$this->nav_acch.'\' STYLE=\'{cursor: pointer;}\' >'.

      $this->hint_href('nav_acc', $url.'_accept='.$record_id, 'myphpgrid_acc', 'document.'.$this->name.'_form.submit();').
      "</SPAN>\n".
      $this->hint_href('nav_cnc', $url.'_cancel='.$record_id, 'myphpgrid_cnc');


    echo "        </TH>\n";

  }

  function count_lookup_fields()
  {
    $sum = 0;
    for ($i = 0; $i < count($this->columns); $i++)
      if ($this->columns[$i]['type'] == 'lookup')
        $sum++;
    return $sum;
  }

  function sum_filters()
  {
    $sum = 0;
    for ($i = 0; $i < count($this->columns); $i++)
      if (isset($this->columns[$i]['can_filter']))
        if ($this->columns[$i]['can_filter'])
          $sum++;
    return $sum;
  }

  function find_lookup_nr($n) // gets real lookup primary field nr for primary field
  {
    // get_lookup_field_nr for this $i
    $nr = 0;
    for ($i = 0; $i <= $n; $i++)
      if ($this->columns[$i]['type'] == 'lookup')
        $nr++;

    return count($this->columns) + $nr - 1;
  }

          //--------------------------------------------------------------------------------
          //  DRAW FIELD
          //--------------------------------------------------------------------------------

  function draw_field($row, $i, $coln, $record_id, $mode)
  {

      $value = $row[$i];

      //
      // check if in edit/add mode field can be edited!
      //
      $ro_mode = '';
      if (($mode=='edit' || $mode=='add') && isset($this->columns[$i]['can_edit']))
        if (!$this->columns[$i]['can_edit'])
          $ro_mode = $mode;

      if ($ro_mode=='add')
        if (isset($this->columns[$i]['default']))
          $value= $this->columns[$i]['default'];


      //--------------------------------------
      //  VIEW MODE & DELETE MODE
      //--------------------------------------

      if ($mode=='view' || $mode=='del' || $ro_mode)
      {
      	  if (isset($this->columns[$i]['visible']) && !$this->columns[$i]['visible']) return;

          switch ($this->columns[$i]['type'])
          {
          case 'boolean' :
            $value = $value ? $this->bool1 : $this->bool2;
            break;
          case 'selection' :
            if (isset($this->columns[$i]["selection"][$value]))
                $value = $this->columns[$i]["selection"][$value];
            break;
          case 'password' :
            $value = $this->pass_str;
            break;
          //default: // text, lookup also
          //  $value = $row[$i];
          }


          if ($ro_mode=='add')
          {
          	if (isset($this->columns[$i]['default']))
          	  $default= $this->columns[$i]['default'];
          	else
          	  $default= '';

            if ($this->columns[$i]['type'] == 'lookup')
              $value = $this->db_lookup($i, $value);

            $value = $value.'<INPUT TYPE="hidden" NAME="'.$this->name.'_'.'e'.$i.'" VALUE="'.$default.'">';

          }


          if (isset($this->columns[$i]["convert_output"]))
          {
          // array unshifted to preserve backward compatibility
            $tmp = $row; array_unshift($tmp,'dummy');
            $value = $this->columns[$i]["convert_output"]($this, $value, $i + 1, $tmp);
          }

          if (empty($value)) $value = '&nbsp;';

          $align = $this->field_property($i, 'align');

          if ($mode=='view')        $class = 'class=\'myphpgrid'.(1 & $coln).'\'';
          if ($mode=='edit')        $class = 'class=\'myphpgrid_edit\'';
          if ($mode=='del')         $class = 'class=\'myphpgrid_del\'';
          if ($mode=='add')         $class = 'class=\'myphpgrid_add\'';

          echo "        <TD $align $class>".$value."</TD>\n";

          return; // exit function
      }


      //--------------------------------------
      //  EDIT MODE
      //--------------------------------------

      if ($mode=='edit' || $mode=='add')
      {

          $name = 'e'.$i;
          $size = (isset($this->columns[$i]['size']) ? $this->columns[$i]['size'] : '');
          $maxlength = (isset($this->columns[$i]['maxlength']) ? $this->columns[$i]['maxlength'] : '');
          $widthst = (isset($this->columns[$i]['width']) ? '{width:'.$this->columns[$i]['width'].'px}' : '');


          // check if 'default' property is set for 'add' mode (2k5 10)
          if ($mode=='add' && isset($this->columns[$i]['default']))
            $value = $this->columns[$i]['default'];

          switch ($this->columns[$i]['type'])
          {
          case 'none' :
            $value='&nbsp;';
            break;

          case 'multiline' :
            $_REQUEST[$this->name.'_'.$name] = $value;
            $value = $this->FEditTextArea($name, '', "myphpgrid_edit", '', '', $widthst);
            break;

          case 'file' :
            $_REQUEST[$this->name.'_'.$name] = $value;
            $value = $this->FEditFile($name, $size, '', "myphpgrid_edit", $maxlength, $widthst);
            break;

          case 'text' :
            $_REQUEST[$this->name.'_'.$name] = $value;
            
            if (!isset($this->columns[$i]["inputdate"])) // (for external calendar JS button)
              $this->columns[$i]["inputdate"] = false;

            if ($this->columns[$i]["inputdate"] && isset($this->columns[$i]['width']))
              $value = $this->FEditText($name, $size, '', "myphpgrid_edit", $maxlength, 
                       '{width:'.($this->columns[$i]['width'] - 20).'}');
            else
              $value = $this->FEditText($name, $size, '', "myphpgrid_edit", $maxlength, $widthst);



            if ($this->columns[$i]["inputdate"])
            {
              $value .= "   <INPUT TYPE='button' onclick='showCalendar(this, ".$this->name."_e$i, ".
                        "\"yyyy-mm-dd\",null,1)' value=':' style='width:16px;font-size:9px'>\n";
            }

            break;

          case 'lookup' :


            // check if 'default' property for column was set in 'add' mode for lookup value
            if ($mode == 'add' && isset($this->columns[$i]['default']))
              $_REQUEST[$this->name.'_'.$name] = $this->columns[$i]['default'];
            else
              $_REQUEST[$this->name.'_'.$name] = $row[$this->find_lookup_nr($i)];

            $value = $this->FSelectMax($name, $this->columns[$i]['lookup_table'],
                                              $this->columns[$i]['lookup_primary'],
                                              $this->columns[$i]['lookup_field'],
                                              '',    //action
                                              false, //oneempty
                                              "myphpgrid_edit"); // & distinct, order, refresh
            break;

          case 'boolean' :
            //$value = $value ? $this->bool1 : $this->bool0;
            $arr = array(false => $this->bool0, true => $this->bool1);
            $value = $this->FSelectMaxArr($name, $arr,
                                              '',    //action
                                              false, //oneempty
                                              "myphpgrid_edit");

            break;

          case 'selection' :
            $_REQUEST[$this->name.'_'.$name] = $value;
            $arr = array();
            foreach ($this->columns[$i]["selection"] AS $key => $val)
              $arr[] = array($key, $val);

            $value = $this->FSelectMaxArr($name, $arr,
                                              '',    //action
                                              false, //oneempty
                                              "myphpgrid_edit");
            break;

          case 'password' :
            $_REQUEST[$this->name.'_'.$name] = $value;
            $value = $this->FEditPass($name, $size, '', "myphpgrid_edit");
            break;

          } // end switch

          if (isset($this->columns[$i]['visible']) && !$this->columns[$i]['visible']) // 2005 12
          {
          	// set default value without showing it to pass it to parse after submitting form
          	if (isset($this->columns[$i]['default']))
          		echo '<INPUT TYPE="hidden" NAME="'.$this->name.'_'.$name.'" VALUE="'.$this->columns[$i]['default'].'">';
          	return;
          }


          if (empty($value)) $value = '&nbsp;';

          $align = $this->field_property($i, 'align');
          $width = $this->field_property($i, 'width');

          if ($mode=='view')        $class = 'class=\'myphpgrid'.(1 & $coln).'\'';
          if ($mode=='edit')        $class = 'class=\'myphpgrid_edit\'';
          if ($mode=='del')         $class = 'class=\'myphpgrid_del\'';
          if ($mode=='add')         $class = 'class=\'myphpgrid_add\'';

          echo "        <TD $align $class $width>\n".$value."</TD>\n";

      } // END OF EDIT MODE


  }

          //--------------------------------------------------------------------------------
          //  DRAW RECORD
          //--------------------------------------------------------------------------------


  function draw_record($row, $coln='0')
  {
    $record_id = array_shift($row);
    $mode='view';

    if ($record_id == $this->editid) $mode = 'edit';
    if ($record_id == $this->delid)  $mode = 'del';
    if ($record_id == $this->addid)  $mode = 'add';

    $this->draw_options($row, $record_id, $mode);

    for ($i = 0; $i < count($this->columns); $i++)

      $this->draw_field($row, $i, $coln, $record_id, $mode);

    if (($mode == 'edit' || $mode == 'add') && $this->json)
        echo '<SCRIPT LANGUAGE="JavaScript">'."\n".     // (focus on first edit field)
             '<!-- Start Hiding the Script'."\n".
             '  a = document.getElementsByName("'.$this->name.'_e0");'.
             "  a[0].focus();\n".
             '// Stop Hiding script --->'."\n".
             '</SCRIPT>'."\n";


  }

          //--------------------------------------------------------------------------------
          //  GET FILTER
          //--------------------------------------------------------------------------------

  function get_filter()
  {
    $filter = array();
    for ($i = 0; $i < count($this->columns); $i++)
      if ($this->fltr[$i] != '')
        $filter[] = $this->table.'.'.$this->columns[$i]['field'].
                   ($this->columns[$i]['type']=='lookup' ?
                        ' = "'.$this->fltr[$i].'"' :
                     ' LIKE "%'.$this->fltr[$i].'%"');

    if (!empty($filter))      $filter = ' WHERE '.implode(' AND ', $filter).' ';
    else $filter = '';

    if (!empty($this->filter))
    {
      if (!is_array($this->filter)) $tmp = array($this->filter);
      else $tmp = $this->filter;
      if (!empty($filter))
        $filter .= ' AND '.implode(',',$tmp);
      else
        $filter .= ' WHERE '.implode(',',$tmp);
    }
    return $filter;
  }


  function ShowQuery($sql)
  {
    echo "<BR>".
         "<table width = '600' bgcolor='#DDDDDD'> <TR> <TD width='600'>".
         $sql.
         "</TD></TR></TABLE>";
  }

          //--------------------------------------------------------------------------------
          //  DRAW RECORDS
          //--------------------------------------------------------------------------------


  function draw_records()
  {
    //
    // prepare query for listing table
    //
    $select = array(); $selpri = array();
    $from   = array();
    $where  = array();

    $select[] = $this->table.'.'.$this->primary;
    $from[]   = $this->table;

    foreach ($this->columns AS $value)
    if ($value['type'] != 'lookup')
      $select[] = $this->table.'.'.$value['field'];
    else
    {
      $select[] = $value['lookup_table'].'.'.$value['lookup_field'];
      $from[]   = $value['lookup_table'];
      $where[] =  $value['lookup_table'].'.'.$value['lookup_primary'].'='.$this->table.'.'.$value['field'];

      // add also non visible primaries field
      $selpri[] = $value['lookup_table'].'.'.$value['lookup_primary'];
    }

    if (!empty($selpri)) $selpri = ','.implode(',', $selpri); else $selpri = '';

    $select = 'SELECT '.implode(',', $select). $selpri;
    $from   = ' FROM ' .implode(',', $from);

    $filter = $this->get_filter();

    if (!empty($where))
      $where = (empty($filter) ? ' WHERE ' : ' AND ').implode(' AND ', $where);
    else
      $where = '';



    $limit = ' LIMIT '.(($this->page-1)*$this->limit).','.$this->limit;

    if (isset($this->sort)  && $this->sort < count($this->columns))
      $sort = ' ORDER BY '. ($this->columns[$this->sort]['type'] != 'lookup' ?
                            $this->table.'.'.$this->columns[$this->sort]['field'] :
                            $this->columns[$this->sort]['lookup_table'].'.'.$this->columns[$this->sort]['lookup_field'] ).
                            ($this->sord == 'D' ? ' DESC ' : '');
    else
      $sort = '';

    $sql = $select. $from. $filter. $where. $sort. $limit;

    //$this->ShowQuery($sql);
    $result = $this->db_query($sql);

    if ($this->json && $this->editid == '' && $this->delid == '' && $this->addid == '')
      $mouse = 'onmouseover="SP(this,\'over\');"  onmouseout="SP(this,\'out\');" '; // onmousedown="SP(this,\'down\');"';
    else
      $mouse = "";

    if ($this->addid < 0) // ADD MODE -1, -2  (2004 10 28)
    {
    	$row = array_fill(0, count($this->columns) + $this->count_lookup_fields(), '');

      if ($this->addid == -2)  // mode when adding record like last one
      {
      	$this->addid = -1;
      	if (isset($_SESSION[$this->name.'_buffered_record']))
      	{
	      	$buffer_rec = explode('&&',$_SESSION[$this->name.'_buffered_record']);
          $l=0;
	      	for ($i=0; $i < count($buffer_rec); $i++) {
	      	  $row[$i] = $buffer_rec[$i];
	      	  if ($this->columns[$i]['type'] == 'lookup') // dodaj lookup-y
	      	    $row[$l++ + count($this->columns)] = $buffer_rec[$i];
	      	}
	      }
      }

      array_unshift($row, -1); // insert first field to record as '-1'

      echo "      <TR>\n";
      $this->draw_record($row, 0);
      echo "      </TR>\n";
    } // if ($this->addid < 0)


    for ($i = 0; $i < mysql_num_rows($result); $i++)
    {
      $row = mysql_fetch_row($result);
      echo "      <TR $mouse>\n";
      $this->draw_record($row, $i);
      echo "      </TR>\n";
    }

  }

          //--------------------------------------------------------------------------------
          //  HINT HREF
          //--------------------------------------------------------------------------------

  function hint_href($name, $href, $class='', $action='')
  {
    $class = (isset($class) ? 'CLASS = "'.$class.'"' : '');
    $h = $name.'h';

    if (!$this->nav_pictures || !file_exists($this->nav_pic_dir.$name.'.gif'))
      $ret = $this->$name;
    else
      $ret = '<IMG SRC="'.$this->nav_pic_dir.$name.'.gif" BORDER="0" ALT="'.($this->$h).'">';

    if ($action == '')
    return
    '          <A '.$class.' HREF="'.$href.'"'.
                           ' TITLE="'.($this->$h).'"'.
                           '>'.$ret.'</A>';
    else
    return
    '          <A '.$class.' HREF="javascript:'.$action.'"'.
                           ' TITLE="'.($this->$h).'"'.
                           '>'.$ret.'</A>';

  }




          //--------------------------------------------------------------------------------
          //  DRAW NAVIGATOR
          //--------------------------------------------------------------------------------


  function draw_navigator()
  {
    $self = $_SERVER['PHP_SELF'].'?'.$this->name.'_page=';
    $rows = $this->db_numrows($this->table);
    $pages = ceil($rows / $this->limit);

    if ($this->page > $pages) $this->page=1;
    $page= $this->page;

    $res =  "<table class='myphpgrid'><tr>".
            "<td align='center' class='myphpgrid_nava' TITLE='".$this->nav_recordsh."'>".$rows."</td>";
    $res .= "<td align='center' class='myphpgrid_nava'>";

    if ($page == 1)
      $res .= "<span class='myphpgrid_nav2'>".$this->nav_frst.' '.$this->nav_prev.'</span>';
    else
      $res .= $this->hint_href('nav_frst', $self.'1',       'myphpgrid_navi').
              $this->hint_href('nav_prev', $self.($page-1), 'myphpgrid_navi');

    $res .= "<span class='myphpgrid_navi'> [$page] </span> ";

    if ($page == $pages)
      $res .= "<span class='myphpgrid_nav2'>".$this->nav_next.' '.$this->nav_last.'</span>';
    else
      $res .= $this->hint_href('nav_next', $self.($page+1), 'myphpgrid_navi').
              $this->hint_href('nav_last', $self.$pages,    'myphpgrid_navi');

    $res .= "</td>".






    "<td align='center'  class='myphpgrid_navb'>";
    $dist1 = $page-1;
    $dist2 = $pages - $page;

    $n_frst = max(     1, $page-max(4-$dist2,2));
    $n_last = min($pages, $page+max(4-$dist1,2));
    for ($i = $n_frst; $i <= $n_last; $i++)
      if ($i == $page)
        $res .= "<span class='myphpgrid_navi'>[$i]</span> ";
      else
        $res .= "<A class='myphpgrid_nav2' TITLE='".$this->nav_selpageh."' HREF =\"$self".$i."\">$i </A>";

    if ($n_last < $pages)
      $res .= "<A class='myphpgrid_nav2' HREF =\"$self".$pages."\">(..$pages) </A>";
    $res .= "</td>";





    if (isset($this->limits))
    {
      $res .= "<td align='center'  class='myphpgrid_navc'>";

      $limits = explode(',', $this->limits);
      for ($i=0; $i < count($limits); $i++)
      {
        $limit = $limits[$i];
        if ($this->limit == $limit) $class = "class='myphpgrid_navi'";
        else                        $class = "class='myphpgrid_nav2'";
        $res .= "<A $class TITLE='".$this->nav_limitsh."' HREF='".$_SERVER['PHP_SELF'].'?'.$this->name.'_limit='.$limit."'>".
                "[".($limit != 18446744073709551615 ? $limit : '&infin;')."]</A>";
      }

      $res .= "</td>";
    }


    $res .=
    "<td align='center'  class='myphpgrid_nava'>".
    "<span class='myphpgrid_nava'>".
    ($this->wrap=='NOWRAP' ?
      $this->hint_href('nav_wrap0', $_SERVER['PHP_SELF'].'?'.$this->name.'_wrap=0', 'myphpgrid_navi')
    :
      $this->hint_href('nav_wrap1', $_SERVER['PHP_SELF'].'?'.$this->name.'_wrap=NOWRAP', 'myphpgrid_navi')
    ).

    '&nbsp;'.
      // print mode
      "<A class='myphpgrid_navi' TITLE='".$this->nav_printmodeh."' HREF='".$_SERVER['PHP_SELF'].'?'.$this->name.'_printmode='.
      ($this->printmode ? '0' : '1')."'>". "[".($this->printmode ? 'v' : 'P')."]</A>".

    '</span></td>';




    $res .=
    "<td align='center'  class='myphpgrid_nava'>".
    "<span class='myphpgrid_nava' TITLE='".$this->nav_nameh."'>".$this->caption.'</span></td>';

    if ($this->cornercontents !='')
    $res .=
    "<td align='center'  class='myphpgrid_nava'>".
    "<span class='myphpgrid_nava'>".$this->cornercontents.'</span></td>';


    $res .= "</tr></table>";

    echo $res;
  }


          //--------------------------------------------------------------------------------
          //  DRAW FILTER
          //--------------------------------------------------------------------------------

  function draw_filter()
  {
    echo "      <TR height='28'>\n";
    echo '        <TH class="myphpgrid_filter" NOWRAP>'."\n".
         $this->hint_href('nav_nof', $_SERVER['PHP_SELF'].'?temp_clear_filter', 'myphpgrid_opts').

         '</TH>';
    for ($i = 0; $i < count($this->columns); $i++)
    {
    	$visible = (isset($this->columns[$i]['visible']) ? $this->columns[$i]['visible'] : true);
      if ($this->columns[$i]['can_filter'] && $visible )
      {
        if ($this->editid == '' && $this->addid == '')
        {
          switch ($this->columns[$i]['type'])
          {
          case 'selection' :
            $arr = array();
            foreach ($this->columns[$i]["selection"] AS $key => $val)
              $arr[] = array($key, $val);

            $hdr = $this->FSelectMaxArr('filter'.$i, $arr,
                                        '',    //action
                                        true, //oneempty
                                        "myphpgrid_edit",
                                        true); // refresh
            break;

          case "lookup":
              $hdr = $this->FSelectMax ('filter'.$i,

                            $this->columns[$i]['lookup_table'],
                            $this->columns[$i]['lookup_primary'],
                            $this->columns[$i]['lookup_field'],

                            '',   true,   'myphpgrid_edit',
                            true, true, true);
            break;

          default: // also for text
            $size = (isset($this->columns[$i]['size']) ? $this->columns[$i]['size'] : '');
            $size = (isset($this->columns[$i]['filter_size']) ? $this->columns[$i]['filter_size'] : $size);
            $hdr = $this->FEditText('filter'.$i, $size, '', 'myphpgrid_edit');
          }
        }
        else // in edit mode filters only to view
        {
          switch ($this->columns[$i]['type'])
          {
          case "lookup":
            $hdr = $this->db_lookup($i, $this->fltr[$i]);
            break;

          default: // also for text
            $hdr = $this->fltr[$i];
          }
        }
      }
      else
        $hdr="&nbsp;";

      if ($visible) // check if column is visible
        echo "        <TH class='myphpgrid_filter'>".$hdr."</TH>\n";

    } // for
    echo "      </TR>\n";

  }

  function draw_grid()
  {
    if ($this->do_full_page) echo $this->html_header;
      else echo $this->js;

    if ($this->custom_header) echo $this->custom_header;


    if ($this->can_navigate) $this->draw_navigator();

    $this->start_table();
    if ($this->can_filter && $this->sum_filters() > 0 && !$this->printmode) $this->draw_filter();
    $this->draw_header();
    $this->draw_records();
    $this->end_table();

    if ($this->custom_footer) echo $this->custom_footer;
    if ($this->do_full_page) echo $this->html_footer;
  }

  function execute()
  {
    $this->initialize();

    $this->db_connect();
    $this->parse_requests();

    $this->draw_grid();
    $this->db_disconnect();
  }

}

?>
