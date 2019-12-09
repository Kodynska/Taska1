<?php
$conn = new mysqli("127.0.0.1", "root", "kotka", "geonames");
// Check connection

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT name FROM countryInfo";
$result = $conn->query($sql);
//$result = mysqli_query($conn, $sql);
if ($result->num_rows > 0) {
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        echo $row['name']."<br>";
    }
} else {
    echo "0 results";
}
$conn->close();
