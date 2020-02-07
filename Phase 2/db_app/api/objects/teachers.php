<?php
class Teacher{
 
    // database connection and table name
    private $conn;
    private $table_name = "Teachers";
 
    // object properties
    public $id;
    public $name;
    public $surname;
    public $username;
    public $password;
    public $email;
 
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    // read products
    function read(){
     
        // select all query
        $query = "SELECT ID, USERNAME, PASSWORD, NAME, SURNAME, EMAIL FROM Teachers";
     
        // prepare query statement
        $stmt = $this->conn->prepare($query);
     
        // execute query
        $stmt->execute();
     
        return $stmt;
    }

    // create product
    function create(){
     
        // query to insert record
        $query = "INSERT INTO Teachers SET  ID=:id, USERNAME=:username, PASSWORD=:password, NAME=:name, SURNAME=:surname, EMAIL=:email";
     
        // prepare query
        $stmt = $this->conn->prepare($query);
     
        // sanitize
        $this->id=htmlspecialchars(strip_tags($this->id));
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->surname=htmlspecialchars(strip_tags($this->surname));
        $this->username=htmlspecialchars(strip_tags($this->username));
        $this->password=htmlspecialchars(strip_tags($this->password));
        $this->email=htmlspecialchars(strip_tags($this->email));
     
        // bind values
        $stmt->bindParam(":id", $this->id);
        $stmt->bindParam(":name", $this->name);
        $stmt->bindParam(":surname", $this->surname);
        $stmt->bindParam(":username", $this->username);
        $stmt->bindParam(":password", $this->password);
        $stmt->bindParam(":email", $this->email);
     
        // execute query
        if($stmt->execute()){
            return true;
        }
     
        return false;
         
    }
}
?>