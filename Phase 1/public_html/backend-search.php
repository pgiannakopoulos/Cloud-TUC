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

 
if(isset($_REQUEST["term"])){

    // Prepare a select statement
    $sql = "SELECT * FROM Students WHERE ID LIKE ? OR NAME LIKE ? OR SURNAME LIKE ? OR FATHERNAME LIKE ?"  ;
    
    if($stmt = mysqli_prepare($link, $sql)){

        // Bind variables to the prepared statement as parameters
        mysqli_stmt_bind_param($stmt, "ssss", $param_term,$param_term,$param_term,$param_term);
        
        // Set parameters
        $param_term = $_REQUEST["term"] . '%';
        
        // Attempt to execute the prepared statement
        if(mysqli_stmt_execute($stmt)){
            $result = mysqli_stmt_get_result($stmt);
            
            // Check the number of rows in the result set
            if(mysqli_num_rows($result) > 0){
                $output = "<table>
                    <tr>
                        <th style='width: 15%'><strong>ID</strong></th>
                        <th style='width: 15%'><strong>Name</strong></th>
                        <th style='width: 15%'><strong>Surname</strong></th>
                        <th style='width: 15%'><strong>Father's name</strong></th>
                        <th style='width: 10%'><strong>Grade</strong></th>
                        <th style='width: 15%'><strong>Mobile number</strong></th>
                        <th style='width: 15%'><strong>Birthday</strong></th>
                    </tr>";

                // Fetch result rows as an associative array
                while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
                    $output.= "<tr>
                                <td style='width: 15%'>".$row["ID"]."</td>
                                <td style='width: 15%'>".$row["NAME"]."</td>
                                <td style='width: 15%'>".$row["SURNAME"]."</td>
                                <td style='width: 15%'>".$row["FATHERNAME"]."</td>
                                <td style='width: 10%'>".$row["GRADE"]."</td>
                                <td style='width: 15%'>".$row["MOBILENUMBER"]."</td>
                                <td style='width: 15%'>".$row["Birthday"]."</td>
                            </tr>";
                }
                echo $output;
            } else{
                $output = "<table>
                    <tr>
                        <th style='width: 15%'><strong>ID</strong></th>
                        <th style='width: 15%'><strong>Name</strong></th>
                        <th style='width: 15%'><strong>Surname</strong></th>
                        <th style='width: 15%'><strong>Father's name</strong></th>
                        <th style='width: 10%'><strong>Grade</strong></th>
                        <th style='width: 15%'><strong>Mobile number</strong></th>
                        <th style='width: 15%'><strong>Birthday</strong></th>
                    </tr>
                    <tr>
                        <td colspan='7' style='text-align: center;'>No records found.</td>
                    </tr>
                </table>";
                echo $output;
            }
        } else{
            echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);
        }
    }
     
    // Close statement
    mysqli_stmt_close($stmt);
}
 
// close connection
mysqli_close($link);
?>