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

// //The htmlspecialchars() function converts special characters to HTML entities. This means that it will replace HTML characters like < and > with &lt; and &gt;. This prevents attackers from exploiting the code by injecting HTML or Javascript code (Cross-site Scripting attacks) in forms.
// $firstname = htmlspecialchars($_SESSION["firstname"]); //
// $surname = htmlspecialchars($_SESSION["surname"]);
 require_once 'config.php';

 ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Teacher Dashboard</title>
    <?php include 'includes.php'; ?>
</head>
<body>
    <?php include 'menu.php'; ?>
    <div class="container my_table">
        <div class="row">
            <h2>Personal Information</h2>
            <div class="col-50"><strong>ID: </strong></div>
            <div class="col-50"><?php echo $id_th; ?></div>

            <div class="col-50"><strong>Name: </strong></div>
            <div class="col-50"><?php echo $firstname_th; ?></div>

            <div class="col-50"><strong>surname_th: </strong></div>
            <div class="col-50"><?php echo $firstname_th; ?></div>

            <div class="col-50"><strong>Username: </strong></div>
            <div class="col-50"><?php echo $username_th; ?></div>

            <div class="col-50"><strong>e-mail: </strong></div>
            <div class="col-50"><?php echo $email_th; ?></div>

            <div class="col-50"><strong>e-mail: </strong></div>
            <div class="col-50">********</div>
            
        </div>
    </div>
    <div class="container my_table">
    <div class="row">
        <?php include 'student_records.php'; ?>
    </div>
</div>
</body>
</html>