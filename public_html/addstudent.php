<?php
// Initialize the session
 session_start();
 
 // define variables and set to empty values
$nameErr = $surnameErr = $emailErr = "";
$name = $email ="";

// Check if the user is logged in, if not then redirect him to login page
if(!isset($_SESSION["loggedin"]) || $_SESSION["loggedin"] !== true){
    header("location: index.php");
    exit;
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
    <div>
        <h1>Add student</h1>
        <p>Please fill in the form.</p>
        <form class="login" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                <label for="id">
                    <i class="fas fa-user"></i> ID
                </label>
                <input type="text" name="id" class="form-control" value="<?php echo $username; ?>"placeholder="id" id="id" required> 

                <label for="name">
                    <i class="fas fa-user"></i> Name
                </label>
                <input type="text" name="name" class="form-control" value="<?php echo $username; ?>"placeholder="Name" id="name" required>

                <label for="surname">
                    <i class="fas fa-user"></i> Surame
                </label>
                <input type="text" name="surname" class="form-control" value="<?php echo $username; ?>"placeholder="Surame" id="name" required> 

                <label for="fathername">
                    <i class="fas fa-user"></i> Fathername
                </label>
                <input type="text" name="fathername" class="form-control" value="<?php echo $username; ?>"placeholder="Fathername" id="fathername" required> 

                <label for="grade">
                    <i class="fas fa-user"></i> Grade
                </label>
                <input type="text" name="grade" class="form-control" value="<?php echo $username; ?>"placeholder="grade" id="Grade" required>

                <label for="mobileNumber">
                    <i class="fas fa-user"></i> Mobile Number
                </label>
                <input type="text" name="mobileNumber" class="form-control" value="<?php echo $username; ?>"placeholder="Mobile number" id="mobileNumber" required>

                <label for="birthday">
                    <i class="fas fa-user"></i> Mobile Number
                </label>
                <input type="date" name="birthday" class="form-control" value="<?php echo $username; ?>"placeholder="Birthday" id="birthday" required>


            <div class="form-group">
                <input type="submit" value="Sumbit">
            </div>
        </form>
        <div class="help-block"><?php echo $err; ?></div>
    </div>    
</body>
</html>
