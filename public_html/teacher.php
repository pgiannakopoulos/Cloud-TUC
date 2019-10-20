<?php
// Initialize the session
session_start();
 
// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
}


$firstname = htmlspecialchars($_SESSION["firstname"]);
$surname = htmlspecialchars($_SESSION["surname"]);
 
 ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Teacher Dashboard</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
<!--     <style type="text/css">
        body{ font: 14px sans-serif; text-align: center; }
    </style> -->
</head>
<body>
    <ul class="topnav">
        <li><a class="active" href="#home">Dashboard</a></li>
        <li><a href="#news">Add</a></li>
        <li><a href="#contact">Edit</a></li>
        <li><a href="#contact">Delete</a></li>
        <li><a href="#contact">Search</a></li>
        <li style="float:right" class="dropdown">
            <a class="dropbtn"><?php echo $firstname." ".$surname; ?></a>
            <div class="dropdown-content">
                <a href="logout.php">logout</a>
            </div>
        </li>
    </ul>
</div>
</body>
</html>