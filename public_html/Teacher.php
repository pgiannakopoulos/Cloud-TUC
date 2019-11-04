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
    <div class="container general_info">
        <div class="row">
            <div class="col-md-6">
                <div class="container-fluid">
                    <h2>Personal Information</h2>
                    <div class="row">
                        <div class="col-xs-6"><strong>ID: </strong></div>
                        <div class="col-xs-6"><?php echo $id_th; ?></div>

                        <div class="col-xs-6"><strong>Name: </strong></div>
                        <div class="col-xs-6"><?php echo $firstname_th; ?></div>

                        <div class="col-xs-6"><strong>Surname: </strong></div>
                        <div class="col-xs-6"><?php echo $surname_th; ?></div>

                        <div class="col-xs-6"><strong>Username: </strong></div>
                        <div class="col-xs-6"><?php echo $username_th; ?></div>

                        <div class="col-xs-6"><strong>e-mail: </strong></div>
                        <div class="col-xs-6"><?php echo $email_th; ?></div>

                        <div class="col-xs-6"><strong>password: </strong></div>
                        <div class="col-xs-6">********</div>
                        
                    </div>
                </div>
            </div>
            <div class="col-xs-6">
                <div class="container-fluid">
                    <h2> History </h2>
                    <div class="row">
                        <?php include 'student_records.php'; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<!-- <?php include 'footer.php'; ?>  -->
</html>