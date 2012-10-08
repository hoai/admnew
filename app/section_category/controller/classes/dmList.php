<?php
require_once('adm.php');
class dmList extends adm
{
	//protected $_db;
	protected $_result;
	public $results;

	
	public function getResults(stdClass $params)
	{
		$query = "SELECT id, name FROM `dm_val`";
		if($this->db->query($query))
			return $this->db->results();
		else
			return array(); 

	}
	
	public function createRecord(stdClass $params)
	{
      $r= $this->db->query("INSERT INTO `dm_val` (name) VALUES (?)",$params->name);

		if($r) {
			$params->id = $this->db->insert_id;		
		}
		
		return $this;
	}
	
	public function updateRecords(stdClass $params)
	{
      $query = "UPDATE `dm_val` SET name=? WHERE id=?";      
		$r = $this->db->query($query,$params->name,$params->id);		
		return $this;
	}
	
	public function destroyRecord($params)
	{
		$query ="DELETE FROM `dm_val` WHERE id = ? LIMIT 1";
		$r = $this->db->query($query,$params->id);	
		return $this;
	}
   public function getTree($params){
      $root    = $params->node;
      $asc     = $params->sort[0]->direction;
      $grid_id = isSet($params->grid_id) ? $params->grid_id : 0;
      if(isSet($params->grid_id)){
         $query ="SELECT l.id,l.name as text FROM `dm_list` l
         INNER JOIN `dm_connect` c
         ON c.id_list = l.id
         WHERE l.owner_id = ? AND c.id_val  = ? ORDER BY l.name $asc";
         $this->db->query($query,$root,$grid_id);	
         $data  = $this->db->results();
         //print_r($data);
         return $data;
      }else return null;
      
   } 
   public function addNode($params){
      
      $owner_id   = $params->owner_id;
      $name       = $params->name;
      $grid_id    = $params->grid_id;
      $query = "INSERT INTO `dm_list` VALUES (null,?,?)";
      $this->db->query($query,$name,$owner_id);
      $params->id = 	$this->db->insert_id();
      $query = "INSERT INTO `dm_connect` VALUES (null,?,?)";      
      $this->db->query($query,$params->id,$grid_id);
      return $params;
	}
   public function updateNode($params){
      $id       = $params->id;
      //$owner_id = $params->owner_id;
      $name     = $params->name;
      $query = "UPDATE `dm_list` SET name = ? WHERE id = ?";
      $this->db->query($query,$name,$id);
      return $params;
	}
   public function deleteNode($params){
      $id         = $params->id;
      $grid_id    = $params->grid_id;
      $ids = $this->getChilds($id);
      array_push($ids,$id);
      $t = implode(',',$ids);
      $query = "DELETE FROM `dm_list` WHERE `id` IN ($t)";      
      $this->db->query($query);
      $query = "DELETE FROM `dm_connect` WHERE id_list IN ($t) AND id_val = ? ";      
      $this->db->query($query,$grid_id);
      return $params;
	}
   public function getChilds($id){
      $rows  = array();
      $query = "SELECT `id` FROM `dm_list` WHERE `owner_id` =  ?";
      $this->db->query($query,$id);
      if($this->db->num_rows() > 0){
         $row = $this->db->results();         
         foreach($row as $v){
            $rows[] = $v->id;
            $rows  = array_merge($rows,$this->getChilds($v->id));
         }
      }
      return $rows;
   }
   public function searchNode($params){
      $text = $params->text;
      $grid_id = $params->grid_id;

      $query = "SELECT  l.`id`, l.`name` AS `text`,
                  IF(LOCATE(?,l.name) > 0, 'Y', 'N') AS `found`,
                  l.owner_id
               FROM `dm_list` l
               INNER JOIN `dm_connect` c
               ON c.id_list = l.id
               WHERE c.id_val  = ?
               " ;

      $this->db->query($query,$text,$grid_id);
      $nodes = array();
      if($this->db->num_rows() > 0){         
        $row = $this->db->results(); 
        //print_r($row);        
        //die();        
         foreach($row as $v){
            $nodes[$v->id] = $v;
         }
      } 
      // Mark all nodes we need to make tree
      foreach ($nodes as $node) {
         if ($node->found == 'Y') {
            $cur_id = $node->owner_id;
            while ($cur_id != 0) {
               $nodes[$cur_id]->found = 'Y';
               $cur_id = $nodes[$cur_id]->owner_id;
            }
         }
      }
//print_r($nodes);
      // Clean unnecessary nodes and properties
      foreach ($nodes as $key => $node) {
         if ($node->found == 'Y') {
            unset($node->found);
         }
         else {
            unset($nodes[$key]);
         }
      }

      // Group nodes by root
      $tree = array();
      foreach ($nodes as $node) {
         $tree[$node->owner_id][] = $node;
      }

      $out = array();
      foreach ($tree[0] as $node) {
         $out[] = self::jsonTree($node, $tree);
      }

      // Check and return
      if (empty($out)) {
         $out = array();
      }
      return $out;
	}
   // Generate output array
   private function jsonTree($node, &$tree) {
      $n = $node;
        
      if (!empty($tree[$n->id])) {
         $n->children = array();
         foreach ($tree[$n->id] as $subnode) {
            $n->children[] = self::jsonTree($subnode, $tree);
         }
         $n->expanded = true;
      }
      else {
         $n->leaf = true;
      }

      return $n;
   }

   public function nodeOrder($params){
      
      $node_id         = $params->node_id;
      $prev_sibling_id = $params->prev_sibling_id;
      $next_sibling_id = $params->next_sibling_id;
      $parent_id       = $params->parent_id;
      $query     = "UPDATE `dm_list` SET owner_id = ? WHERE id = ? ";
      $this->db->query($query,$parent_id,$node_id);
      // Изменение порядка типа товара в дереве
      
	}
   public function getResultsAlias(stdClass $params)
	{
      
		$query = "SELECT * FROM `dm_val_alias` WHERE owner_id = ?";
		if(isSet($params->owner_id) && $this->db->query($query,$params->owner_id))
			return $this->db->results();
		else
			return array(); 

	}
	
	public function createRecordAlias(stdClass $params)
	{
      $r= $this->db->query("INSERT INTO `dm_val_alias` (name,owner_id) VALUES (?,?)",$params->name,$params->owner_id);

		if($r) {
			$params->id = $this->db->insert_id;		
		}
		
		return $this;
	}
	
	public function updateRecordsAlias(stdClass $params)
	{
      $query = "UPDATE `dm_val_alias` SET name=? WHERE id=?";      
		$r = $this->db->query($query,$params->name,$params->id);		
		return $this;
	}
	
	public function destroyRecordAlias($params)
	{
		$query ="DELETE FROM `dm_val_alias` WHERE id = ? LIMIT 1";
		$r = $this->db->query($query,$params->id);	
		return $this;
	}
   

}
