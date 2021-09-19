<?php
  include('dbconn.php');
  //getting the entery value from the from
  $search = $_POST["searchEntry"];
  //creating MySQL object and querying for search 
  $db_object = new dbconn();
  $db_object->display_search_result($search);
 ?>
