<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $SuppName = $_POST['SuppName'];

    
    $con = new mysqli('localhost', 'root', '', 'mydb');


    if ($con->connect_error) {
        die("Connection failed: " . $con->connect_error);
    }
    

    $stmt = $con->prepare("INSERT INTO supplier (SuppName) VALUES (?)");
    
    if ($stmt === false) {
        die("Prepare failed: " . $con->error);
    }

    $stmt->bind_param("s", $SuppName);

    
    if ($stmt->execute(1)) {
        echo "Successfully submitted";
    } else {
        die("Execute failed: " . $stmt->error);
    }

    
    $stmt->close();
    $con->close();
}
?>