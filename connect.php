<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    
    $compname = $_POST['compname'];
    $compqyt = $_POST['compqyt'];
    $desp = $_POST['desp'];

    
    $compname = filter_var($compname, FILTER_SANITIZE_STRING);
    $compqyt = filter_var($compqyt, FILTER_SANITIZE_NUMBER_INT);
    $desp = filter_var($desp, FILTER_SANITIZE_STRING);

    
    $con = new mysqli('localhost', 'root', '', 'mydb');

  
    if ($con->connect_error) {
        die("Connection failed: " . $con->connect_error);
    }
    
   
    $stmt = $con->prepare("INSERT INTO component (CompName, compqty, CompDesp) VALUES (?, ?, ?)");
    
    if ($stmt === false) {
        die("Prepare failed: " . $con->error);
    }

    $stmt->bind_param("sis", $compname, $compqyt, $desp);

    
    if ($stmt->execute()) {
        echo "Successfully submitted";
    } else {
        die("Execute failed: " . $stmt->error);
    }

    $stmt->close();
    $con->close();
}
?>