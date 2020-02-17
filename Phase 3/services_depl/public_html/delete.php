<?php

// Initialize the session
if (!isset($_SESSION)) {
    session_start();
}

// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
}elseif (!$_SESSION["delete_access"]){
    header("location: auth_error.php");
    exit;
}

//DB connection
require_once "config.php";

$id=$_REQUEST['id'];


//Delete the student record
$get_data = callAPI('DELETE', $db_service.'/api/student/'.$id, $data, false);

if ($httpcode == 200) {
    header("location: DeleteStudent.php");
    exit;
} else {
    echo "Error deleting record: ".$httpcode;
}
?>
