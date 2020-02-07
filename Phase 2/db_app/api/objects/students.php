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

    // read students
    function read(){
     
        // select all query
        $query = "SELECT ID, NAME, SURNAME, FATHERNAME, GRADE, MOBILENUMBER, Birthday FROM ".$this->table_name;
     
        // prepare query statement
        $stmt = $this->conn->prepare($query);
     
        // execute query
        $stmt->execute();
     
        return $stmt;
    }

    // create student
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

    // used when filling up the update product form
    function readOne(){
     
        // query to read single record
        $query = "SELECT ID, NAME, SURNAME, FATHERNAME, GRADE, MOBILENUMBER, Birthday FROM Students WHERE ID = ? ";
     
        // prepare query statement
        $stmt = $this->conn->prepare( $query );
     
        // bind id of product to be updated
        $stmt->bindParam(1, $this->id);
     
        // execute query
        $stmt->execute();
     
        // get retrieved row
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
     
        // set values to object properties
        $this->id= $row['ID'];
        $this->name= $row['NAME'];
        $this->surname= $row['SURNAME'];
        $this->fathername= $row['FATHERNAME'];
        $this->grade= $row['GRADE'];
        $this->mobilenumber= $row['MOBILENUMBER'];
        $this->birthday= $row['Birthday'];

        // echo $stmt->rowCount();
    }

    // update the student
    function update(){
     
        // update query
        $query = "UPDATE ". $this->table_name ." SET ID=:id, NAME=:name, SURNAME=:surname, FATHERNAME =:fathername, GRADE =:grade, MOBILENUMBER =:mobilenumber, Birthday =:birthday WHERE ID=".$this->id; 
     
        // prepare query statement
        $stmt = $this->conn->prepare($query);
     
        // sanitize
        $this->name=htmlspecialchars(strip_tags($this->name));
        $this->price=htmlspecialchars(strip_tags($this->price));
        $this->description=htmlspecialchars(strip_tags($this->description));
        $this->category_id=htmlspecialchars(strip_tags($this->category_id));
        $this->id=htmlspecialchars(strip_tags($this->id));
     
        // bind new values
        $stmt->bindParam(":id", $this->id);
        $stmt->bindParam(":name", $this->name);
        $stmt->bindParam(":surname", $this->surname);
        $stmt->bindParam(":fathername", $this->fathername);
        $stmt->bindParam(":grade", $this->grade);
        $stmt->bindParam(":mobilenumber", $this->mobilenumber);
        $stmt->bindParam(":birthday", $this->birthday);
     
        // execute the query
        if($stmt->execute()){
            return true;
        }
     
        return false;
    }

    // delete the student
    function delete(){
     
        // delete query
        $query = "DELETE FROM " . $this->table_name . " WHERE ID = ?";
     
        // prepare query
        $stmt = $this->conn->prepare($query);
     
        // sanitize
        $this->id=htmlspecialchars(strip_tags($this->id));
     
        // bind id of record to delete
        $stmt->bindParam(1, $this->id);
     
        // execute query
        if($stmt->execute()){
            return true;
        }
     
        return false;
         
    }

    // search students
    function search($keywords){
     
        // select all query
        $query = "SELECT * FROM " . $this->table_name . " WHERE ID LIKE ? OR NAME LIKE ? OR SURNAME LIKE ? OR FATHERNAME LIKE ?"  ;
     
        // prepare query statement
        $stmt = $this->conn->prepare($query);
     
        // sanitize
        $keywords=htmlspecialchars(strip_tags($keywords));
        $keywords = "%{$keywords}%";
     
        // bind
        $stmt->bindParam(1, $keywords);
        $stmt->bindParam(2, $keywords);
        $stmt->bindParam(3, $keywords);
        $stmt->bindParam(4, $keywords);
     
        // execute query
        $stmt->execute();
     
        return $stmt;
    }
}
?>