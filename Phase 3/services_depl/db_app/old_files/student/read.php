<?php
// required headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Allow-Credentials: true");
header('Content-Type: application/json');
 
// include database and object files
include_once '../config/database.php';
include_once '../objects/students.php';

// get database connection
$database = new Database();
$db = $database->getConnection();
 
// prepare product object
$student = new Student($db);

if (isset($_GET['id'])) {
    // set ID property of record to read
    $student->id = $_GET['id'];
    // read the details of product to be edited
    $student->readOne();
     
    if($student->name!=null){
        // create array
        $student_arr = array(
            "id" =>  $student->id ,
            "name" => $student->name,
            "surname" => $student->surname,
            "fathername" => $student->fathername,
            "grade" => $student->grade,
            "mobilenumber" => $student->mobilenumber,
            "birthday" => $student->birthday
     
        );
     
        // set response code - 200 OK
        http_response_code(200);
     
        // make it json format
        echo json_encode($student_arr);
    }
     
    else{
        // set response code - 404 Not found
        http_response_code(404);
     
        // tell the user product does not exist
        echo json_encode(array("message" => "Student does not exist."));
    }
}else{
        $stmt = $student->read();
        $num = $stmt->rowCount();
         
        // check if more than 0 record found
        if($num>0){
         
            // teachers array
            $students_arr=array();
            $students_arr["records"]=array();
         
            // retrieve our table contents
            // fetch() is faster than fetchAll()
            // http://stackoverflow.com/questions/2770630/pdofetchall-vs-pdofetch-in-a-loop
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){
                // extract row
                // this will make $row['name'] to
                // just $name only
                extract($row);
         
                $student_item=array(
                    "id" => $ID,
                    "name" => $NAME,
                    "surname" => $SURNAME,
                    "fathername" => $FATHERNAME,
                    "grade" => $GRADE,
                    "mobilenumber" => $MOBILENUMBER,
                    "birthday" => $Birthday
                );
         
                array_push($students_arr["records"], $student_item);
            }
         
            // set response code - 200 OK
            http_response_code(200);
         
            // show teachers data in json format
            echo json_encode($students_arr);
        }else{
         
            // set response code - 404 Not found
            http_response_code(404);
         
            // tell the user no teachers found
            echo json_encode(
                array("message" => "No students found.")
            );
        }
    }
?>