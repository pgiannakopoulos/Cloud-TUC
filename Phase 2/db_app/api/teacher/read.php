<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

//In this case, our read.php file can be read by anyone (asterisk * means all) and will return a data in JSON format.
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/teachers.php';
 
// instantiate database and product object
$database = new Database();
$db = $database->getConnection();
 
// initialize object
$product = new Teacher($db);
 
// query products
$stmt = $product->read();
$num = $stmt->rowCount();
 
// check if more than 0 record found
if($num>0){
 
    // teachers array
    $teachers_arr=array();
    $teachers_arr["records"]=array();
 
    // retrieve our table contents
    // fetch() is faster than fetchAll()
    // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        // extract row
        // this will make $row['name'] to
        // just $name only
        extract($row);
 
        $teacher_item=array(
            "id" => $ID,
            "name" => $NAME,
            "surname" => $SURNAME,
            "username" => $USERNAME,
            "password" => $PASSWORD,
            "email" => $EMAIL
        );
 
        array_push($teachers_arr["records"], $teacher_item);
    }
 
    // set response code - 200 OK
    http_response_code(200);
 
    // show teachers data in json format
    echo json_encode($teachers_arr);
}else{
 
    // set response code - 404 Not found
    http_response_code(404);
 
    // tell the user no teachers found
    echo json_encode(
        array("message" => "No teachers found.")
    );
}
 