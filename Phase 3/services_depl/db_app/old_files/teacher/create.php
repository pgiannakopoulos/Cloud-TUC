<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// get database connection
include_once '../config/database.php';
 
// instantiate product object
include_once '../objects/teachers.php';
 
$database = new Database();
$db = $database->getConnection();
 
$teacher = new Teacher($db);
 
// get posted data
$data = json_decode(file_get_contents("php://input"));
 
// make sure data is not empty
if(
    !empty($data->id) &&
    !empty($data->name) &&
    !empty($data->surname) &&
    !empty($data->username) &&
    !empty($data->password) &&
    !empty($data->email)
){
 
    // set product property values
    $teacher->id = $data->id;
    $teacher->name = $data->name;
    $teacher->surname = $data->surname;
    $teacher->username = $data->username;
    $teacher->password = $data->password;
    $teacher->email = $data->email;
 
    // create the product
    if($teacher->create()){
 
        // set response code - 201 created
        http_response_code(201);
 
        // tell the user
        echo json_encode(array("message" => "Teacher was created."));
    }
 
    // if unable to create the product, tell the user
    else{
 
        // set response code - 503 service unavailable
        http_response_code(503);
 
        // tell the user
        echo json_encode(array("message" => "Unable to create teacher."));
    }
}
 
// tell the user data is incomplete
else{
 
    // set response code - 400 bad request
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to create teacher. Data is incomplete."));
}
?>