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
        <?php include 'includes.php'; ?>
        <title>Delete Student</title>
    </head>
    <body>
        <?php include 'menu.php'; ?>
        <div class="student_list">
            <table>
                <thead>
                    <tr>
                        <th><strong>ID</strong></th>
                        <th><strong>Name</strong></th>
                        <th><strong>Surname</strong></th>
                        <th><strong>Action</strong></th>
                    </tr>
                </thead>
                <tbody>

                <?php
                $sql="SELECT ID, NAME, SURNAME FROM Students ORDER BY ID DESC;";
                $result = mysqli_query($link,$sql);

                if (mysqli_num_rows($result) > 0) {
                    while($row = mysqli_fetch_assoc($result)) { 
                    echo "<tr>";
                        echo '<td align="center">'.$row["ID"].'</td>';
                        echo '<td align="center">'.$row["NAME"].'</td>';
                        echo '<td align="center">'.$row["SURNAME"].'</td>';
                        echo '<td align="center"><a href="delete.php?id='.$row["ID"].'" onclick="return ConfirmDelete()" ><i class="fa fa-trash"></i></a></td>';
                    echo "</tr>";
                    } 
                }
                mysqli_close($link);
                ?>
                </tbody>
            </table>
        </div>
    </body>
</html>