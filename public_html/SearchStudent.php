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

// Include config file
require_once "config.php";
require_once "functions.php";

?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Search Student</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script src="js/scripts.js"></script>
    </head>
    <body>
        <?php include 'menu.php'; ?>
        <div class="search-box">
            <input type="text" autocomplete="off" placeholder="Search a Student..." />
        </div>
        <div class="result">
                <table>
                    <tr>
                        <th><strong>ID</strong></th>
                        <th><strong>Name</strong></th>
                        <th><strong>Surname</strong></th>
                        <th><strong>Father's name</strong></th>
                        <th><strong>Grade</strong></th>
                        <th><strong>Mobile number</strong></th>
                        <th><strong>Birthday</strong></th>
                    </tr>
                    <tr>
                        <td colspan="7" style="text-align: center;">Search something...</td>

                    </tr>
                </table>
        </div>
    </body>
</html>