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

//Database connection
require_once 'config.php';

//Count Teachers
$get_data = callAPI('GET', $db_service.'/api/teacher/read.php', false);
$response = json_decode($get_data, true);

$teacher_num = count($response['records']);

//Count Students
$get_data = callAPI('GET', $db_service.'/api/student/', false);
$response = json_decode($get_data, true);

$student_num = count($response['records']);



//Calculate the average of the grade of all students
$sum = 0;
$grade_avg = "-";

foreach ($response['records'] as $student){
    $sum = $sum + $student['grade'];
}

if ($student_num > 0){
    $grade_avg =  round($sum / $student_num , 2);
}

 ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Teacher Dashboard</title>
    <?php include 'includes.php'; ?>
</head>
<body>
    <?php include 'menu.php'; ?>
    <div id="content">
        <div class="container general_info">
            <div class="row">
                <div class="col-md-6">
                    <div class="container-fluid info">
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
                <div class="col-md-6">
                    <div class="container-fluid stats">
                        <h2>System Status</h2>
                        <div class="row">
                            <div class="col-xs-6"><strong>Day: </strong></div>
                            <div class="col-xs-6"><?php echo date("l"); ?></div>

                            <div class="col-xs-6"><strong>Date: </strong></div>
                            <div class="col-xs-6"><?php echo date("d/m/Y"); ?></div>

                            <div class="col-xs-6"><strong>Timestamp: </strong></div>
                            <div class="col-xs-6"><?php echo date("h:i:sa"); ?></div>  
                            
                            <div class="col-xs-6"><strong>Teachers Records: </strong></div>
                            <div class="col-xs-6"><?php echo $teacher_num; ?></div>

                            <div class="col-xs-6"><strong>Students Records: </strong></div>
                            <div class="col-xs-6"><?php echo $student_num; ?></div>

                            <div class="col-xs-6"><strong>Grade Average: </strong></div>
                            <div class="col-xs-6"><?php echo $grade_avg."/10"; ?></div>     
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid my_table">
                <div class="row">
                    <h2>Student Records</h1>
                    <?php include 'student_records.php'; ?>
                </div>
            </div>
        </div>
    </div>
    <?php include 'footer.php'; ?> 
</body>

</html>