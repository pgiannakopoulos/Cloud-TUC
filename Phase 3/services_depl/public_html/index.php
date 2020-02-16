<?php
// Initialize the session
if (!isset($_SESSION)) {
    session_start();
}

// Check if the user is already logged in, if yes then redirect him to welcome page
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
    header("location: Teacher.php");
    exit;
}
 
// Include config file
require_once "config.php";
require_once "functions.php";    //containes the secure_input() function

// Define variables and initialize with empty values
$username = $password = "";
$err = "";
 
// Processing form data when form is submitted
if($_SERVER["REQUEST_METHOD"] == "POST"){

    // Check if username is empty, remove spaces.
    if(empty(trim($_POST["username"]))){
        $err = "Please enter username.";
    } else{
        $username = secure_input($_POST["username"]); 
    }
    
    // Check if password is empty
    if(empty(trim($_POST["password"]))){
        $err = "Please enter your password.";
    } else{
        $password = secure_input($_POST["password"]);
    }
    
    // Validate credentials
    if(empty($err)){
            $get_data = callAPI('GET', $db_service.'/api/teacher/'.$username, false, false);
            if ($get_data) {
                $response = json_decode($get_data, true); //When TRUE, returned objects will be converted into associative arrays
                // Check if username exists, if yes then verify password
                if($response['username']){                    
                    // password_verify($password, $hashed_password)
                    if(strcmp($password, $response['password']) == 0){
                        // Password is correct, so start a new session
                        session_start();
                                
                        // Store data in session variables
                        $_SESSION["type"] = "stdnet";
                        $_SESSION["loggedin"] = true;
                        $_SESSION["id"] = $response['id'];
                        $_SESSION["username"] = $response['username']; 
                        $_SESSION["firstname"] = $response['name']; 
                        $_SESSION["surname"] = $response['surname'];
                        $_SESSION["email"] = $response['email'];

                        //Initialize history table for students adds
                        $_SESSION["array_record"] = array();
                        $_SESSION["array_pointer"] = 0;                            
                                
                        // Redirect user to welcome page
                        header("location: Teacher.php");
                    } else{
                    // Display an error message if password is not valid
                        $err = "The password you entered was not valid.";
                    }
                }else{
                    // Display an error message if username doesn't exist
                    $err = "No account found with that username.";
                }
            }else{
                $err = "Oops! Something went wrong. Please try again later.";
            } 
    }
}
?>
 
<!DOCTYPE html>
<html lang="en">
<head>
   <!-- Include the css style etc -->
    <?php include 'includes.php'; ?>   
    <title>Login</title>
</head>
<body>
    <div id="header"></div>
    <div id="content" class="login_screen">
        <div class="login">
            <img class="logo1" src="images/tuc_logo.png">
            <img class="logo2" src="images/system_logo.png">
            <h1>Login</h1>
            <p>Please fill in your credentials to login.</p>
            <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
                    <label for="username">
                        <i class="fas fa-user"></i>
                    </label>
                    <input type="text" name="username" class="form-control" value="<?php echo $username; ?>"placeholder="Username" id="username" required>  
                    <label for="password">
                        <i class="fas fa-lock"></i>
                    </label>
                    <input type="password" name="password" class="form-control" placeholder="Password" id="password" required>
                <div class="form-group">
                    <input type="submit" value="Sumbit">
                </div>
            </form>
            <div class="help-block"><?php echo $err; ?></div>
            <p>OR</p>
            <div class="oauth2"><button onclick="location.href='http://172.18.1.5:3000/oauth2/authorize?response_type=code&client_id=85f07c06-d8b3-4f72-83ee-60b1db8f0e8c&state=xyz&redirect_uri=http://localhost/Teacher.php'">Keyrock</button></div>
        </div>
    </div>
    <?php include 'footer.php'; ?> 
</body>
</html>