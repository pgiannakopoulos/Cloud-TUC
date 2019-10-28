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
            
            // Check number of rows in the result set
            if(mysqli_num_rows($result) > 0){
                $output = "<table>
                    <tr>
                        <th><strong>ID</strong></th>
                        <th><strong>Name</strong></th>
                        <th><strong>Surname</strong></th>
                        <th><strong>Father's name</strong></th>
                        <th><strong>Grade</strong></th>
                        <th><strong>Mobile number</strong></th>
                        <th><strong>Birthday</strong></th>
                    </tr>";
                // Fetch result rows as an associative array
                while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
                    $output.= '<tr>
                                <td>'.$row["ID"].'</td>
                                <td>'.$row["NAME"].'</td>
                                <td>'.$row["SURNAME"].'</td>
                                <td>'.$row["FATHERNAME"].'</td>
                                <td>'.$row["GRADE"].'</td>
                                <td>'.$row["MOBILENUMBER"].'</td>
                                <td>'.$row["Birthday"].'</td>
                            </tr>';
                }
                echo $output;
            } else{
                $output = "<table>
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