<?php


class dbconn {
  public $servername = "localhost";
  public $username = "root";
  public $password = "";

  //constructer for creating connection to MySQL server
  function __construct(){
    $this->conn = mysqli_connect($this->servername, $this->username, $this->password, "file_system");
  }
  //for inserting the parent node into the parent table
  function insert_parent_node($parent_node){
    $parent_node = $parent_node;
    $sql = "INSERT INTO `parent_nodes` (`parent_node_id`, `parent_node`) VALUES (NULL, '".$parent_node."')";
    if(mysqli_query($this->conn , $sql)){
        echo "Successfully inserted records.<br>";
    } else{
        echo "error: unable to execute $sql. " . mysqli_error($this->conn);
    }
  }
  function select_parent_id($parent_node){
    $parent_node = $parent_node;
    $sql = "SELECT `parent_node_id` FROM `parent_nodes` WHERE `parent_node` = '".$parent_node."'";
    $result = $this->conn->query($sql);
    $parent_node_id = '';
    if ($result->num_rows > 0) {
      // output data of each row
      while($row = $result->fetch_assoc()) {
        $parent_node_id = $row["parent_node_id"];
      }
    } else {
      echo "No result found";
    }
    return $parent_node_id;
  }
  //for inserting the child id, child node, and path into the child table
  function insert_child_and_path($child_node, $fullpath, $parent_node_id){
    $sql = "  INSERT INTO `child_nodes` (`child_node_id`, `child_node`, `child_node_path`, `parent_node_id`) VALUES (NULL, '".$child_node."', '".$fullpath."', '".$parent_node_id."')";
    if(mysqli_query($this->conn, $sql)){
        echo "Successfully inserted records.<br>";
    } else{
        echo "error: unable to execute $sql. " . mysqli_error($this->conn );
    }
  }
  //for displaying information to the user (FrontEnd)
  function display_search_result($search){
    $sql = "  SELECT * FROM `child_nodes` WHERE `child_node_path` LIKE '%".$search."%'";
    $result = $this->conn->query($sql);
    if ($result->num_rows > 0) {
      while($row = $result->fetch_assoc()) {
        echo  $row["child_node_path"]."<br>";
      }
    } else {
      echo "No file found!";
    }
  }
  //destructer for closing the MySQl connection
  function __destruct(){
    mysqli_close($this->conn);
  }

}
