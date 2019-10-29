<table>
    <tr>
        <th><strong>ID</strong></th>
        <th><strong>Name</strong></th>
        <th><strong>Surname</strong></th>
    </tr>
<?php
if (count($added_students) > 0) {
    for ($i=0; $i < count($added_students) ; $i++) { 
        echo "<tr>";
        echo "<td>".$added_students[$i][0]."</td>";
        echo "<td>".$added_students[$i][1]."</td>";
        echo "<td>".$added_students[$i][2]."</td>";
        echo "</tr>";
    }    
}else{
    echo "<tr>";
    echo "<td> - </td>";
    echo "<td> - </td>";
    echo "<td> - </td>";
    echo "</tr>";
}
?>
</table>