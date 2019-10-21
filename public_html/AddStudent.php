<?php
// Initialize the session
 session_start();
 
 // define variables and set to empty values
$err = $message = "";
$name = $email ="";

// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
}

// Include config file
require_once "config.php";

// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){
 
    $id = $_POST["id"];
    $name = $_POST["name"];
    $surname = $_POST["surname"];
    $fathername = $_POST["fathername"];
    $grade = (real)$_POST["grade"];
    $mobile_number = $_POST["mobile_number"];
    $birthday = $_POST["birthday"];
    
    // Validate credentials
    if(empty($err)){
        // Prepare a select statement
        $sql = "INSERT INTO Students (ID, NAME, SURNAME, FATHERNAME, GRADE, MOBILENUMBER, Birthday)
        VALUES (?,?,?,?,?,?,?)";
        /* create a prepared statement */
 
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "sssssss", $id, $name, $surname, $fathername, $grade, $mobile_number, $birthday);
            
            // Set parameters
            // $param_username = $username;

            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                $message = '<span style="color:green">You added a student!</span>';
            }else{
                $message = '<span style="color:red">Oops! Something went wrong. Please try again later.</span>';
            }
        }
        
        // Close statement
        mysqli_stmt_close($stmt);
    }
    
    // Close connection
   mysqli_close($link);
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
    <link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <a href="Teacher.php"><button class="button button_back">Back to Dashboard</button></a>
    <div class="container admin_form">
        <h1>Add student</h1>
        <p>Please fill in the form.</p>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="row">
                <div class="col-25">    
                    <label for="id">ID</label>
                </div>
                <div class="col-75">
                    <input type="text" name="id" id="id" required>
                </div>

                <div class="col-25">
                    <label for="name">First Name</label>
                </div>
                <div class="col-75">
                    <input type="text" name="name" id="name" required>
                </div>

                <div class="col-25">
                    <label for="surname">Last Name</label>
                </div>
                <div class="col-75">
                    <input type="text" name="surname" id="surname" required>
                </div>

                <div class="col-25">
                    <label for="fathername">Father's name</label>
                </div>
                <div class="col-75">
                    <input type="text" name="fathername" id="fathername" required>
                </div>

                <div class="col-25">
                    <label for="grade">Grade</label>
                </div>
                <div class="col-75">
                    <input type="text" name="grade" id="grade" required>
                </div>

                <div class="col-25">
                    <label for="mobile_number">Mobile number</label>
                </div>
                <div class="col-75">
                    <input type="text" name="mobile_number" id="mobile_number" required>
                </div>

                <div class="col-25">
                    <label for="birthday">Birthday</label>
                </div>
                <div class="col-75">
                    <input type="date" name="birthday" id="birthday" required>
                </div>

            <div class="form-group">
                <input type="submit" value="Sumbit">
            </div>
        </form>
    </div>  
    <div class="notifier"><?php echo $message; ?></div>  
</body>
</html>