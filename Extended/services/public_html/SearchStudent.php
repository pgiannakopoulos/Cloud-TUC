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
// elseif (!$_SESSION["search_access"]){
//     header("location: auth_error.php");
//     exit;
// }

require_once "config.php";
require_once "functions.php";

?>

<!-- The search functionality is implemented in scripts.js and backend-seach.php -->
<!DOCTYPE html>
<html lang="en">
    <head>
        <?php include 'includes.php'; ?>
        <title>Search Student</title>
    </head>
    <body>
        <?php include 'menu.php'; ?>
        <div id="content">
            <div class="search-box">
                <input type="text" autocomplete="off" placeholder="Search a Student by id, name, surname or father's name..." />
            </div>
            <div class="result my_table_60">
                    <table>
                        <tr>
                            <th style="width: 15%"><strong>ID</strong></th>
                            <th style="width: 15%"><strong>Name</strong></th>
                            <th style="width: 15%"><strong>Surname</strong></th>
                            <th style="width: 15%"><strong>Father's name</strong></th>
                            <th style="width: 10%"><strong>Grade</strong></th>
                            <th style="width: 15%"><strong>Mobile number</strong></th>
                            <th style="width: 15%"><strong>Birthday</strong></th>
                        </tr>
                        <tr>
                            <td colspan="7" style="text-align: center;">Search something...</td>

                        </tr>
                    </table>
            </div>
        </div>
    </body>
    <?php include 'footer.php'; ?> 
</html>