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

?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <?php include 'includes.php'; ?>
        <title>Edit Student</title>
    </head>
    <body>
        <?php include 'menu.php'; ?>
        <div id="content">
            <div class="student_list">
                <table>
                    <tr>
                        <th style="width: 23%"><strong>ID</strong></th>
                        <th style="width: 23%"><strong>Name</strong></th>
                        <th style="width: 23%"><strong>Surname</strong></th>
                        <th style="width: 8%; text-align: center;"><strong>Action</strong></th>
                     </tr>
                <?php
                
                // Show all student in the database
                $sql="SELECT ID, NAME, SURNAME FROM Students ORDER BY ID DESC;";
                $result = mysqli_query($link,$sql);

                if (mysqli_num_rows($result) > 0) {
                    while($row = mysqli_fetch_assoc($result)) { 
                    echo "<tr>";
                        echo '<td style="width: 23%">'.$row["ID"].'</td>';
                        echo '<td style="width: 23%">'.$row["NAME"].'</td>';
                        echo '<td style="width: 23%">'.$row["SURNAME"].'</td>';
                        echo '<td style="width: 8%; text-align: center;"><a href="edit.php?id='.$row["ID"].'"><i class="fas fa-edit"></i></a></td>';
                    echo "</tr>";                    
                    } 
                }
                mysqli_close($link);
                ?>
                </table>
            </div>
        </div>
    </body>
    <?php include 'footer.php'; ?> 
</html>