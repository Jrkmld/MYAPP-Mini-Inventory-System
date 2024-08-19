<?php
if ($_SERVER['REQUEST_METHOD']=='POST'){
$name = $_POST['name'];
$quantity = $_POST['quantity'];

$con = new mysqli('localhost', 'root', '', 'mydb');

if ($con){
  echo "Connection successfully";

    $stmt = $con->prepare("INSERT INTO product (ProdName, QtyonHand) VALUES (?, ?)");
    $stmt->bind_param("si", $name, $quantity);

    if ($stmt->execute()) {
        echo "Successfully submitted";
   } else {
        die("Error: " . $stmt->error);
   }

    $stmt->close();
   $con->close();

 }
}
?>