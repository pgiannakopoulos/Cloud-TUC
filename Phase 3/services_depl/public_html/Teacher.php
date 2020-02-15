<?php
//Database connection
require_once 'config.php';

$url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]";
$parts = parse_url($url);
parse_str($parts['query'], $query);

if ($query['code'] && !isset($_SESSION)) {
    $header = array("Host: idm",
                "Authorization: Basic ".$auth_basic,
                "Content-Type: application/x-www-form-urlencoded");

    $data = "grant_type=authorization_code&code=".$query['code']."&redirect_uri=http://localhost/Teacher.php";

    $get_data = callAPI("POST", $auth_service.'/oauth2/token', $data, $header);

    $response = json_decode($get_data, true); //When TRUE, returned objects will be converted into associative arrays
    
    $array = array();
    foreach($response as $x => $x_value) {
        if (is_string ( $x_value)==true){
            $array[$x] = $x_value;
        }else{
            if(is_string($x_value)==true){
                foreach($x_value as $y => $y_value){
                    if($y=="value")
                        $array[$x] = $y_value;
                }
            }

        }
    }
    foreach($array as $y => $y_value){
        if($y=="access_token"){
            $access_token=$y_value;
        }
        if($y=="refresh_token"){
            $refresh_token=$y_value;
        }
    }
    if ($access_token) {
        $get_data = callAPI("GET", $auth_service.'/user?access_token='.$access_token, false, false);

        $response = json_decode($get_data, true); //When TRUE, returned objects will be converted into associative arrays


        session_start();
        $_SESSION["access_token"] = $access_token; // start a session with the access_token
        $_SESSION["loggedin"] = true;
        $_SESSION["id"] = "oauth2_".substr($access_token, 0, 5);
        $_SESSION["username"] = $response['username']; 
        $_SESSION["firstname"] =$response['username']; 
        $_SESSION["surname"] = "Undefined"; 
        $_SESSION["email"] = $response['email']; 

        //Initialize history table for students adds
        $_SESSION["array_record"] = array();
        $_SESSION["array_pointer"] = 0;
    }else{
        header("location: index.php");
        exit;
    }

}else{
    // Initialize the session
    if (!isset($_SESSION)) {
        session_start();
    }
     
    // Check if the user is logged in, if not then redirect him to login page
    if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
        header("location: index.php");
        exit;
    }
}


//Count Teachers
$get_data = callAPI('GET', $db_service.'/api/teacher/', false,false);
$response = json_decode($get_data, true);

$teacher_num = count($response['records']);

//Count Students
$get_data = callAPI('GET', $db_service.'/api/student/', false,false);
$response = json_decode($get_data, true);

if ($httpcode== 200) {
    $student_num = count($response['records']);
}else{
    $student_num = 0;
}


//Calculate the average of the grade of all students
$sum = 0;
$grade_avg = "-";

if ($student_num > 0) {
    foreach ($response['records'] as $student){
        $sum = $sum + $student['grade'];
    }

    if ($student_num > 0){
        $grade_avg =  round($sum / $student_num , 2);
    }
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