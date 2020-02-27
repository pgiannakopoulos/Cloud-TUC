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

 
if(isset($_REQUEST["term"])){
    //search to db service
    $header = array("Authorization: "." ".$_SESSION["token_type"]." ".$_SESSION["access_token"]);
    $get_data = callAPI('GET', $db_service.'/api/student/search?s='.$_REQUEST["term"], $data, $header);
    $response = json_decode($get_data, true);
            
            // Check the number of rows in the result set
            if($httpcode == 200){
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
                foreach ($response['records'] as $student){ 
                    $output.= "<tr>
                                <td style='width: 15%'>".$student["id"]."</td>
                                <td style='width: 15%'>".$student["name"]."</td>
                                <td style='width: 15%'>".$student["surname"]."</td>
                                <td style='width: 15%'>".$student["fathername"]."</td>
                                <td style='width: 10%'>".$student["grade"]."</td>
                                <td style='width: 15%'>".$student["mobilenumber"]."</td>
                                <td style='width: 15%'>".$student["birthday"]."</td>
                            </tr>";
                }
                echo $output;
            } elseif ($httpcode ==401){
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
                        <td colspan='7' style='text-align: center;'>Unauthorized!</td>
                    </tr>
                </table>";
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
     
}
 
?>