<?php
  error_reporting(E_ALL);
  require_once "./MyPHPGrid/MyPHPGrid.php";
  session_start();

	$grid = new MyPHPGrid;
	$grid->table = "outgoing";
	$grid->primary = "id".$grid->table;
	$grid->limit = 20;
  $grid->do_full_page = true;

	$grid->columns = array(
	    array(
	        "field" => "Nomor_Agenda",
	        "caption" => "Nomor Agenda",
	        "maxlength" => 80,
	        "width" => 80,
	    ),
	    array(  "field" => "Tanggal",
			        "caption" => "Tanggal",
			        "maxlength" => 10,
			        "align" => "center",
			        "width" => 80,
			        "inputdate" => true,
			        "filter_size" => 25 ),	   
	    array(
	        "field" => "Pembuat",
	        "caption" => "Pembuat",
	                "type" => "lookup",
			        "lookup_table" => "fungsi",
			        "lookup_primary" => "idfungsi",
			        "lookup_field" => "nama",
			        ),	    	    
	    
	    array(
	        "field" => "Perihal",
	        "caption" => "Perihal",
	        "maxlength" => 20,
	        "align" => "left",
	        "width" => 80,
	        "filter_size" => 10
	    ),
	    array(
	        "field" => "Ditujukan",
	        "caption" => "Ditujukan",
	        "maxlength" => 20,
	        "align" => "left",
	        "width" => 80,
	        "filter_size" => 10
	    ),
	     array(
	        "field" => "Arsip_Pada",
	        "caption" => "Arsip Pada",
	                "type" => "lookup",
			        "lookup_table" => "fungsi2",
			        "lookup_primary" => "idfungsi",
			        "lookup_field" => "nama",
			        ),	    	    	    	    	
	    array(  "field" => "Kirim_Via",
			        "type" => "lookup",
			        "lookup_table" => "via",
			        "lookup_primary" => "idvia",
			        "lookup_field" => "nama",
			        "width" => 120 ),
	    
	    array(
	        "field" => "Keterangan",
	        "caption" => "Keterangan",
	        "maxlength" => 20,
	        "align" => "left",
	        "width" => 100,
	        "can_filter" => false
	    ),	        
);

include('MySQLGridPrint.inc');
$grid->execute();

?>
