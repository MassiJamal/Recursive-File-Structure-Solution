<?php
//Recursive File Structure Class
class file_structure_nodes {
  public $parent_node;
  public $child_node;
  public $child_path;
  //constructer to create parent node, child node and path objects
  function __construct($parent_node =null, $child_node=null, $child_path=null) {
    $this->parent_node = $parent_node;
    $this->child_node = $child_node;
    $this->child_path = $child_path;

  }
  //Methods
  //Recursive File Structure Class Setters
  function set_parent_node($parent_node) {
    $this->parent_node = $parent_node;
  }
  function set_child_node($child_node) {
  $this->child_node = $child_node;
  }
  function set_child_path($child_path) {
  $this->child_path = $child_path;
  }
  //Recursive File Structure Class Getters
  function get_parent_node() {
    return $this->parent_node;
  }
  function get_child_node() {
    return $this->child_node;
  }
  function get_child_path() {
    return $this->child_path;
  }



}
?>
