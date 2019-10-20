<?php
//This prevents attackers from exploiting the code by injecting HTML or Javascript code (Cross-site Scripting attacks) in forms.

function secure_input($data) {
  $data = trim($data);       //strip unnecessary characters (extra space, tab, newline) 
  $data = stripslashes($data);  //Remove backslashes (\) from the user input data
  $data = htmlspecialchars($data); //This function converts special characters to HTML entities
  return $data;
}
?>