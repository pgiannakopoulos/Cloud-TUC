<?php

// Initialize the session
if (!isset($_SESSION)) {
    session_start();
}

// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
}

//DB connection
require_once "config.php";

$id=$_REQUEST['id'];


//Delete the student record
$sql='DELETE FROM Students WHERE ID="'.$id.'";';

if (mysqli_query($link, $sql)) {
    mysqli_close($link);
    header("location: DeleteStudent.php");
    exit;
} else {
    echo "Error deleting record: " . mysqli_error($conn);
}
?>
