<?php
$host = 'mysql';
$user = 'root';
$pass = 'rootpassword';
$db_name = 'mydb';

$conn = new mysqli($host, $user, $pass, $db_name);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} else {
    echo "Connected to MySQL successfully!";
}

$sql = "INSERT INTO Teachers(ID, NAME,SURNAME,USERNAME,PASSWORD,EMAIL)
VALUES ('243','Doe', 'Kosa', 'myname', 'pasw', 'ks@gmail.com')";

if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}



$sql = "SELECT * FROM Teachers";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "id: " . $row["ID"]. " - Name: " . $row["NAME"]. " " . $row["SURNAME"]. "<br>";
    }
} else {
    echo "0 results";
}
$conn->close();

echo "You have an admin! myname / pasw";


?>