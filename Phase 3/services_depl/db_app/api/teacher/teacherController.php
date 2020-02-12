<?php
// include database and object files
include_once '../config/database.php';
include_once '../objects/teachers.php';

class TeacherController
{
	private $teacher;
	
	public function __construct()
	{
		// get database connection
		$database = new Database();
		$conn = $database->getConnection();
		$this->teacher = new Teacher($conn);
	}

	public function readOneTeacher($id){
		// set ID property of record to read
	    $this->teacher->username = $id;
	    // read the details of product to be edited
	    $this->teacher->readOne();
	     
	    if($this->teacher->name!=null){
	        // create array
	        $teacher_arr = array(
	            "id" =>  $this->teacher->id ,
	            "name" => $this->teacher->name,
	            "surname" => $this->teacher->surname,
	            "username" => $this->teacher->username,
	            "password" => $this->teacher->password,
	            "email" => $this->teacher->email,
	     
	        );
	     
	        // set response code - 200 OK
	        http_response_code(200);
	     
	        // make it json format
	        echo json_encode($teacher_arr);
	    }
	     
	    else{
	        // set response code - 404 Not found
	        http_response_code(404);
	     
	        // tell the user product does not exist
	        echo json_encode(array("message" => "Teacher does not exist."));
	    }
	}

	public function readTeachers(){
		// query products
	    $stmt = $this->teacher->read();
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
	}
}