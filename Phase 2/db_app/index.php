<?php
echo "string";
 
// Check if the user is already logged in, if yes then redirect him to welcome page
if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
    header("location: Teacher.php");
    exit;
}
 
// Include config file
require_once "config.php";



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
        // Prepare a select statement
        $sql = "SELECT ID, USERNAME, PASSWORD, NAME, SURNAME, EMAIL FROM Teachers WHERE USERNAME = ?";

        /* create a prepared statement */
        if($stmt = mysqli_prepare($link, $sql)){
            // Bind variables to the prepared statement as parameters
            mysqli_stmt_bind_param($stmt, "s", $param_username);
            
            // Set parameters
            $param_username = $username;
            
            // Attempt to execute the prepared statement
            if(mysqli_stmt_execute($stmt)){
                
                // Store result
                mysqli_stmt_store_result($stmt);
                
                // Check if username exists, if yes then verify password
                if(mysqli_stmt_num_rows($stmt) == 1){                    
                    
                    // Bind result variables
                    mysqli_stmt_bind_result($stmt, $id, $username, $hashed_password, $firstname, $surname, $email);
                    if(mysqli_stmt_fetch($stmt)){
                        
                        // password_verify($password, $hashed_password)
                        if(strcmp($password, $hashed_password) == 0){
                            
                            // Password is correct, so start a new session
                            session_start();
                            
                            // Store data in session variables
                            $_SESSION["loggedin"] = true;
                            $_SESSION["id"] = $id;
                            $_SESSION["username"] = $username; 
                            $_SESSION["firstname"] = $firstname; 
                            $_SESSION["surname"] = $surname;
                            $_SESSION["email"] = $email;

                            //Initialize history table for students adds
                            $_SESSION["array_record"] = array();
                            $_SESSION["array_pointer"] = 0;                            
                            
                            // Redirect user to welcome page
                            header("location: Teacher.php");
                        } else{
                            // Display an error message if password is not valid
                            $err = "The password you entered was not valid.";
                        }
                    }
                } else{
                    // Display an error message if username doesn't exist
                    $err = "No account found with that username.";
                }
            } else{
                echo "Oops! Something went wrong. Please try again later.";
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
        </div>
    </div>
    <?php include 'footer.php'; ?>    
</body>
</html>