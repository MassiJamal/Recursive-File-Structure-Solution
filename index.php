<?php

//index for running the Recursive File Structure Solution

//imports
include('dbconn.php');
include('file_structure_nodes.php');

//Reading the txt file that contain the data
$file = fopen("RecursiveFileStructure.txt", "r");

//array for storing the txt file data
$file_paths = array();
while (!feof($file)) {
   $file_paths[] = fgets($file);
}
fclose($file);


//parent_nodes_array is used to enusre parent nodes are stored once parent table
$parent_nodes_array = array();

//loop for file_paths for getting each value
foreach ($file_paths as $value){
  //replacing backslash with doule backslash to ensure it is stored MySQL child table
  $fullpath_backslash = str_replace("\\", "\\\\", $value);
  //separating the values in the array with backlash
  $single_path = explode("\\", $value);
  //creating file_structure_nodes object
  $file_node_object = new file_structure_nodes($single_path[count($single_path)-2], $single_path[count($single_path)-1], $fullpath_backslash);

  //using getters to get the value
  $parent_node = $file_node_object->get_parent_node();
  $child_node = $file_node_object->get_child_node();
  $child_path = $file_node_object->get_child_path();

  //creating MySQL object to the connect to the database and execute sql queries
  $db_object = new dbconn();
  //if function is used to ensure doplicate parent node is not entered in the database
  if (!in_array($parent_node, $parent_nodes_array)){
    array_push($parent_nodes_array, $parent_node);
    $db_object = new dbconn();
    $db_object->insert_parent_node($parent_node);
  }
  $parent_node_id = $db_object->select_parent_id($parent_node);
  $db_object->insert_child_and_path($child_node, $child_path, $parent_node_id);
}
