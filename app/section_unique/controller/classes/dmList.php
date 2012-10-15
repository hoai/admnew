<?php
require_once('adm.php');
class dmList extends adm
{
	//protected $_db;
	protected $_result;
	public $results;

   public function getTree($params){
      $root    = $params->node;
      $asc     = $params->sort[0]->direction;
      $query ="SELECT id,name as text FROM `catalog` WHERE root = ? order by name $asc";
      //echo $query;
      $this->db->query($query,$root);	
      $data  = $this->db->results();
      return $data;

      
   } 
   public function addNode($params){
      
      $owner_id   = $params->owner_id;
      $name       = $params->name;

      $query = "INSERT INTO `catalog` VALUES (null,?,?)";
      $this->db->query($query,$name,$owner_id);
      $params->id = 	$this->db->insert_id();

      return $params;
	}
   public function updateNode($params){
      $id       = $params->id;
      //$owner_id = $params->owner_id;
      $name     = $params->name;
      $query = "UPDATE `catalog` SET name = ? WHERE id = ?";
      $this->db->query($query,$name,$id);
      return $params;
	}
   public function deleteNode($params){
      $id         = $params->id;
      $grid_id    = $params->grid_id;
      $ids = $this->getChilds($id);
      array_push($ids,$id);
      $t = implode(',',$ids);
      $query = "DELETE FROM `catalog` WHERE `id` IN ($t)";      
      $this->db->query($query);
      return $params;
	}
   public function getChilds($id){
      $rows  = array();
      $query = "SELECT `id` FROM `catalog` WHERE `root` =  ?";
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
      $query = "SELECT  `id`, `name` AS `text`,
                  IF(LOCATE(?,name) > 0, 'Y', 'N') AS `found`,
                  root
               FROM `catalog` order by name asc
               " ;

      $this->db->query($query,$text,$grid_id);
      $nodes = array();
      if($this->db->num_rows() > 0){         
        $row = $this->db->results();         
         foreach($row as $v){
            $nodes[$v->id] = $v;
         }
      } 
      // Mark all nodes we need to make tree
      foreach ($nodes as $node) {
         if ($node->found == 'Y') {
            $cur_id = $node->root;
            while ($cur_id != 0) {
               $nodes[$cur_id]->found = 'Y';
               $cur_id = $nodes[$cur_id]->root;
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
         $tree[$node->root][] = $node;
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
      $query     = "UPDATE `catalog` SET root = ? WHERE id = ? ";
      $this->db->query($query,$parent_id,$node_id);
      // Изменение порядка типа товара в дереве
      
	}
 
   

}
