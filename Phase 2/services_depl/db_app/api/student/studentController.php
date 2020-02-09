<?php
// include database and object files
include_once '../config/database.php';
include_once '../objects/students.php';

class StudentController
{
	private $student;
	
	public function __construct()
	{
		// get database connection
		$database = new Database();
		$conn = $database->getConnection();
		$this->student = new Student($conn);
	}

	public function readOneStudent($id){
		// set ID property of record to read
	    $this->student->id = $id;
	    // read the details of product to be edited
	    $this->student->readOne();
	     
	    if($this->student->name){
	        // create array
	        $student_arr = array(
	            "id" =>  $this->student->id ,
	            "name" => $this->student->name,
	            "surname" => $this->student->surname,
	            "fathername" => $this->student->fathername,
	            "grade" => $this->student->grade,
	            "mobilenumber" => $this->student->mobilenumber,
	            "birthday" => $this->student->birthday
	     
	        );
	     
	        // set response code - 200 OK
	        http_response_code(200);
	     
	        // make it json format
	        echo json_encode($student_arr);
	    }else{
	        // set response code - 404 Not found
	        http_response_code(404);
	     
	        // tell the user product does not exist
	        echo json_encode(array("message" => "Student does not exist."));
	    }
	}

	public function readStudents(){
		$stmt = $this->student->read();
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

	public function createStudent(){
		// get posted data
		$data = json_decode(file_get_contents("php://input"));
		 
		// make sure data is not empty
		if(
		    !empty($data->id) &&
		    !empty($data->name) &&
		    !empty($data->surname) &&
		    !empty($data->fathername) &&
		    !empty($data->grade) &&
		    !empty($data->mobilenumber) &&
		    !empty($data->birthday)
		){
		 
		    // set product property values
		    $this->student->id = $data->id;
		    $this->student->name = $data->name;
		    $this->student->surname = $data->surname;
		    $this->student->fathername = $data->fathername;
		    $this->student->grade = $data->grade;
		    $this->student->mobilenumber = $data->mobilenumber;
		    $this->student->birthday = $data->birthday;
		 
		    // create the product
		    if($this->student->create()){
		 
		        // set response code - 201 created
		        http_response_code(201);
		 
		        // tell the user
		        echo json_encode(array("message" => "Student was created."));
		    }
		 
		    // if unable to create the product, tell the user
		    else{
		        // set response code - 503 service unavailable
		        http_response_code(503);
		 
		        // tell the user
		        echo json_encode(array("message" => "Unable to create student."));
		    }
		}
		 
		// tell the user data is incomplete
		else{
		    // set response code - 400 bad request
		    http_response_code(400);
		 
		    // tell the user
		    echo json_encode(array("message" => "Unable to create student. Data is incomplete."));
		}
	}

	public function updateStudent($id){
		// get id of student to be edited
		$data = json_decode(file_get_contents("php://input"));
		 
		// set ID property of student to be edited
		$this->student->id = $id;
		 
		// set student property values
		$this->student->name = $data->name;
		$this->student->surname = $data->surname;
		$this->student->fathername = $data->fathername;
		$this->student->grade = $data->grade;
		$this->student->mobilenumber = $data->mobilenumber;
		$this->student->birthday = $data->birthday;

		// update the student
		if($this->student->update()){
		 
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
	}

	public function deleteStudent($id){
		// get student id
		//$data = json_decode(file_get_contents("php://input"));
		 
		// set student id to be deleted
		echo "delete=".$id;
		$this->student->id = $id;

		// delete the student
		if($this->student->delete()){
		 
		    // set response code - 200 ok
		    http_response_code(200);
		 
		    // tell the user
		    echo json_encode(array("message" => "student was deleted."));
		}
		 
		// if unable to delete the student
		else{
		 
		    // set response code - 503 service unavailable
		    http_response_code(503);
		 
		    // tell the user
		    echo json_encode(array("message" => "Unable to delete student."));
		}
	}
	
	public function searchStudents($keywords){

		// query students
		$stmt = $this->student->search($keywords);
		$num = $stmt->rowCount();

		 
		// check if more than 0 record found
		if($num>0){
		 
		    // students array
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
		 
		    // show students data
		    echo json_encode($students_arr);
		}
		 
		else{
		    // set response code - 404 Not found
		    http_response_code(404);
		 
		    // tell the user no students found
		    echo json_encode(
		        array("message" => "No students found.")
		    );
		}
	}

}

?>