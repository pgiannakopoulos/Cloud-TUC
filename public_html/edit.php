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

require_once "config.php";
require_once "functions.php";

$id=$_REQUEST['id'];

$sql='SELECT * FROM Students WHERE ID="'.$id.'";';
$result = mysqli_query($link, $sql);
$row = mysqli_fetch_assoc($result);
if (mysqli_num_rows($result) <= 0) {
	echo "ERROR";
}
?>

<!DOCTYPE html>
<html lang="en">
	<head>
        <meta charset="UTF-8">
        <title>Edit Student</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
	<div class="container admin_form">
<!--         <h1>Add student</h1>
        <p>Please fill in the form.</p> -->
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
            <div class="row">
                <div class="col-25">    
                    <label for="id">ID</label>
                </div>
                <div class="col-75">
                    <input type="text" name="id" id="id" placeholder="1234" value="<?php echo $row['ID'];?>" required>
                </div>

                <div class="col-25">
                    <label for="name">First Name</label>
                </div>
                <div class="col-75">
                    <input type="text" name="name" id="name" placeholder="Kostas" value="<?php echo $row['NAME'];?>" required>
                </div>

                <div class="col-25">
                    <label for="surname">Last Name</label>
                </div>
                <div class="col-75">
                    <input type="text" name="surname" id="surname" placeholder="Kostopoulos" value="<?php echo $row['SURNAME'];?>"required> 
                </div>

                <div class="col-25">
                    <label for="fathername">Father's name</label>
                </div>
                <div class="col-75">
                    <input type="text" name="fathername" id="fathername" placeholder="Giannis" value="<?php echo $row['FATHERNAME'];?>" required> 
                </div>

                <div class="col-25">
                    <label for="grade">Grade</label>
                </div>
                <div class="col-75">
                    <input type="text" name="grade" id="grade" placeholder="7.5" value="<?php echo $row['GRADE'];?>" required> 
                </div>

                <div class="col-25">
                    <label for="mobile_number">Mobile number</label>
                </div>
                <div class="col-75">
                    <input type="text" name="mobile_number" id="mobile_number" placeholder="6925856000" value="<?php echo $row['MOBILENUMBER'];?>" required>
                </div>

                <div class="col-25">
                    <label for="birthday">Birthday</label>
                </div>
                <div class="col-75">
                    <input type="date" name="birthday" id="birthday" value="<?php echo $row['Birthday'];?>" required> 
                </div>

            <div class="form-group">
                <input type="submit" value="Sumbit">
            </div>
        </form>
    </div> 
</body>
</html>