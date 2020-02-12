<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: PUT");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/students.php';
 
// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare student object
$student = new Student($db);
 
// get id of student to be edited
$data = json_decode(file_get_contents("php://input"));
 
// set ID property of student to be edited
$student->id = $_SERVER['id'];
 
// set student property values
$student->name = $data->name;
$student->surname = $data->surname;
$student->fathername = $data->fathername;
$student->grade = $data->grade;
$student->mobilenumber = $data->mobilenumber;
$student->birthday = $data->birthday;
 
// update the student
if($student->update()){
 
    // set response code - 200 ok
    http_response_code(200);
 
    // tell the user
    echo json_encode(array("message" => "student was updated."));
}
 
// if unable to update the student, tell the user
else{
 
    // set response code - 503 service unavailable
    http_response_code(503);
 
    // tell the user
    echo json_encode(array("message" => "Unable to update student."));
}
?>