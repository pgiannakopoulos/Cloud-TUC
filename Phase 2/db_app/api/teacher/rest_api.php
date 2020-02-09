<?php 
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: OPTIONS,GET,POST,PUT,DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// include database and object files
include_once 'teacherController.php';

$uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$uri = explode( '/', $uri );

// the user id is, of course, optional and must be a number:
$requestMethod = $_SERVER["REQUEST_METHOD"];
$userId = $_REQUEST['id'];

// pass the request method and user ID to the PersonController and process the HTTP request:
if ($uri[2] == 'teacher') {
	$controller = new TeacherController();
	switch ($requestMethod) {
		case 'GET':
	    	if ($userId) {
		    	$controller->readOneTeacher($userId);
		    }else{
		        $controller->readTeachers();
		    };
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