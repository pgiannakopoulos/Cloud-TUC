<?php
//The htmlspecialchars() function converts special characters to HTML entities. This means that it will replace HTML characters like < and > with &lt; and &gt;. This prevents attackers from exploiting the code by injecting HTML or Javascript code (Cross-site Scripting attacks) in forms.

$firstname_th = htmlspecialchars($_SESSION["firstname"]); //
$surname_th = htmlspecialchars($_SESSION["surname"]);
$id_th = htmlspecialchars($_SESSION["id"]);
$username_th = htmlspecialchars($_SESSION["username"]);
$email_th = htmlspecialchars($_SESSION["email"]);

?>
<div id="header">
    <ul class="topnav">
        <li><a class="active" href="Teacher.php">Dashboard</a></li>
        <li><a href="AddStudent.php">Add</a></li>
        <li><a href="EditStudent.php">Edit</a></li>
        <li><a href="DeleteStudent.php">Delete</a></li>
        <li><a href="SearchStudent.php">Search</a></li>
        
        <li style="float:right" class="dropdown">
        <a class="dropbtn"><?php echo $firstname_th." ".$surname_th; ?></a>
            <div class="dropdown-content">
                <a href="logout.php" onclick="return ConfirmLogout()">logout</a>
            </div>
        </li>
    </ul>
</div>