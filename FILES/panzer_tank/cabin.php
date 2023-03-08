
<?php
 
  error_reporting(E_ALL);
  require_once "./MyPHPGrid/MyPHPGrid.php";
  session_start();
  
	$grid = new MyPHPGrid;
	$grid->table = "outgoing";
	$grid->primary = "Nomor_Agenda";
	$grid->limit = 40;
  $grid->do_full_page = true;

	$grid->columns = array(
	    array(
	        "field" => "Nomor_Agenda",
	        "caption" => "No. Surat",
	        "type" => "none",
	        "width" => 50,
	        "filter_size" => 10,
	        "align" => "right",
	        "visible" => true	   
	    ),
	    array(
	        "field" => "Kode_Bidang",
	        "caption" => "Kode Bidang",
	        "default" => "/XX/ISL/I/15",
	        "maxlength" => 80,
	        "width" => 80,
	        "filter_size" => 10	   
	    ),
	    array(  "field" => "Tanggal",
			        "caption" => "Tgl/Date",
	  	            "maxlength" => 10,
			        "align" => "center",
			        "width" => 80,
			        "inputdate" => true,
			        "filter_size" => 10 ),	   
		array(
	        "field" => "Ditujukan",
	        "caption" => "Kepada/To",
	        "maxlength" => 50,
	        "align" => "left",
	        "width" => 80,
	        "filter_size" => 10
	    ),
	    
		array(
	        "field" => "Pembuat",
	        "caption" => "Pembuat/By",
	                "type" => "lookup",
			        "lookup_table" => "fungsi",
			        "lookup_primary" => "idfungsi",
			        "lookup_field" => "nama",
			        ),	    	    
	    
	    array(
	        "field" => "Perihal",
	        "caption" => "Perihal/Subject",
	        
	        "align" => "left",
	        "width" => 130,
	        "filter_size" => 40
	    ),
	    
	     array(
	        "field" => "Arsip_Pada",
	        "caption" => "Arsip Pada/Archieve",
	                "type" => "lookup",
			        "lookup_table" => "fungsi2",
			        "lookup_primary" => "idfungsi",
			        "lookup_field" => "nama",
			        ),	    	    	    	    	
	    array(  "field" => "Kirim_Via",
	        	"caption" => "Via",
	    	        "type" => "lookup",
			        "lookup_table" => "via",
			        "lookup_primary" => "idvia",
			        "lookup_field" => "nama",
			        "width" => 120 ),
	    
	    array(
	        "field" => "Keterangan",
	        "caption" => "Keterangan",
	        "align" => "left",
	        "width" => 100,
	        "can_filter" => false
	    ),	        
);

include('MySQLGridPrint.inc');
$grid->execute();

?>

