<?php
class Student{
 
    // database connection and table name
    private $conn;
    private $table_name = "Students";
 
    // object properties
    public $id;
    public $name;
    public $surname;
    public $fathername;
    public $grade;
    public $mobilenumber;
    public $birthday;
 
    // constructor with $db as database connection
    public function __construct($db){
        $this->conn = $db;
    }

    // read products
    function read(){
     
        // select all query
        $query = "SELECT ID, NAME, SURNAME, FATHERNAME, GRADE, MOBILENUMBER, Birthday FROM ".$this->table_name;
     
        // prepare query statement
        $stmt = $this->conn->prepare($query);
     
        // execute query
        $stmt->execute();
     
        return $stmt;
    }

    // create product
    function create(){
     
        // query to insert record
        $query = "INSERT INTO Students SET ID=:id, NAME=:name, SURNAME=:surname, FATHERNAME=:fathername, GRADE=:grade, MOBILENUMBER=:mobilenumber, Birthday=:birthday";
     
        // prepare query
        $stmt = $this->conn->prepare($query);
     
        // sanitize
        $this->id=htmlspecialchars(strip_tags($this->id));
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->surname=htmlspecialchars(strip_tags($this->surname));
        $this->fathername=htmlspecialchars(strip_tags($this->fathername));
        $this->grade=htmlspecialchars(strip_tags($this->grade));
        $this->mobilenumber=htmlspecialchars(strip_tags($this->mobilenumber));
        $this->birthday=htmlspecialchars(strip_tags($this->birthday));
     
        // bind values
        $stmt->bindParam(":id", $this->id);
        $stmt->bindParam(":name", $this->name);
        $stmt->bindParam(":surname", $this->surname);
        $stmt->bindParam(":fathername", $this->fathername);
        $stmt->bindParam(":grade", $this->grade);
        $stmt->bindParam(":mobilenumber", $this->mobilenumber);
        $stmt->bindParam(":birthday", $this->birthday);
     
        // execute query
        if($stmt->execute()){
            return true;
        }
     
        return false;
         
    }
}
?>