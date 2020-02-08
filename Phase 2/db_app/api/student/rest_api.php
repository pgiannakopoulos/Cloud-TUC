<?php 
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: OPTIONS,GET,POST,PUT,DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// include database and object files
include_once 'studentController.php';

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = explode( '/', $uri );

// the user id is, of course, optional and must be a number:
$requestMethod = $_SERVER["REQUEST_METHOD"];
$userId = $_REQUEST['id'];

echo "ID=".$userId;

// pass the request method and user ID to the PersonController and process the HTTP request:
echo $requestMethod;
if ($uri[2] == 'student') {
	$controller = new StudentController();
	switch ($requestMethod) {
	    case 'GET':
		    if ($userId) {
	            $controller->readOneStudent($userId);
	        }else{
	            $controller->readStudents();
	        };
			break;
	    case 'POST':
	    	$controller->createStudent();
	    	break;
	    case 'PUT':
	        $controller->updateStudent($userId);
	    	break;
	    case 'DELETE':
	        $controller->deleteStudent($userId);
	    	break;
	    default:
	    	http_response_code(404);
	    	header("HTTP/1.1 404 Not Found");
	        echo json_encode(
		        array("message" => "Invalid method.")
		    );
	        break;
	    }
}
?>