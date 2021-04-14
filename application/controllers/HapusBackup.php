<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class HapusBackup extends CI_Controller {

	public function index()
	{
	    $tables             = $this->input->get('table');
		$backup_name        = "{$tables}-backup.sql";
	    // $tables             = "soal";

	    $mysql 	= new mysqli($this->db->hostname,$this->db->username,$this->db->password,$this->db->database);
		$myql 	= $mysql->query("SET NAMES 'utf8'");
		$sql 	= $mysql->query('SHOW TABLES');

		while($row = $sql->fetch_row())
		{
			$target_tables[] = $row[0]; 
        }   
        // var_dump($target_tables);
        if($tables !== false) 
        { 
            $target_tables = array_intersect($target_tables, [$tables]); 
        }
        // var_dump($target_tables);
        // exit;

        foreach($target_tables as $table)
        {
            $result         = $mysql->query('SELECT * FROM '.$table);  
            $fields_amount  = $result->field_count;  
            $rows_num=$mysql->affected_rows;     
            // $res            = $mysql->query('SHOW CREATE TABLE '.$table); 
            // $TableMLine     = $res->fetch_row();
            // $content        = (!isset($content) ?  '' : $content) . "\n\n".$TableMLine[1].";\n\n";
            $content        = "";

            for ($i = 0, $st_counter = 0; $i < $fields_amount;   $i++, $st_counter=0) 
            {
                while($row = $result->fetch_row())  
                { //when started (and every after 100 command cycle):
                    if ($st_counter%100 == 0 || $st_counter == 0 )  
                    {
                            $content .= "\nINSERT INTO ".$table." VALUES";
                    }
                    $content .= "\n(";
                    for($j=0; $j<$fields_amount; $j++)  
                    { 
                        $row[$j] = str_replace("\n","\\n", addslashes($row[$j]) ); 
                        if (isset($row[$j]))
                        {
                            $content .= '"'.$row[$j].'"' ; 
                        }
                        else 
                        {   
                            $content .= '""';
                        }     
                        if ($j<($fields_amount-1))
                        {
                                $content.= ',';
                        }      
                    }
                    $content .=")";
                    //every after 100 command cycle [or at last line] ....p.s. but should be inserted 1 cycle eariler
                    if ( (($st_counter+1)%100==0 && $st_counter!=0) || $st_counter+1==$rows_num) 
                    {   
                        $content .= ";";
                    } 
                    else 
                    {
                        $content .= ",";
                    } 
                    $st_counter=$st_counter+1;
                }
            } $content .="\n\n\n";
        }

        $backup_name = $backup_name ? $backup_name : $name.".sql";
        header('Content-Type: application/octet-stream');   
        header("Content-Transfer-Encoding: Binary"); 
        header("Content-disposition: attachment; filename=\"".$backup_name."\"");  
        echo $content; exit;
	}

    public function truncate()
    {
        $tables             = $this->input->get('table');

        $this->db->query('TRUNCATE '.$tables);

        echo "<script>window.location = '".$_SERVER['HTTP_REFERER'] . "'</script>";
    }
	
	function __construct()
	{
		parent::__construct();
	}
}

/* End of file HapusBackup.php */
/* Location: ./application/controllers/HapusBackup.php */