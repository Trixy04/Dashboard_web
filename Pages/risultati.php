<?php
$servername = "localhost";
$username = "mamp";
$password = "";
$dbname = "verificaSQL";

$tot = 0;

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT Targa, Marca, Modello, Cilindrata, Potenza, CodFiscaleProprietario, CodicePolizza  FROM Auto";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $tabella = "";
    // output data of each row
    while ($row = $result->fetch_assoc()) {
        $tabella .= "<tr>
    <td>" . $row["Targa"] . "</td>
    <td>" . $row["Marca"] . "</td>
    <td>" . $row["Modello"] . "</td>
    <td>" . $row["Cilindrata"] . "</td>
    <td> " . $row["Potenza"] . "</td>
    <td> " . $row["CodFiscaleProprietario"] . "</td>
    <td> " . $row["CodicePolizza"] . "</td>
    </tr>";
    }
} else {
}

$sql = "SELECT COUNT(*) FROM `consegna`";
$result = $conn->query($sql);
$tot = $row["COUNT(*)"];
echo $tot;

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/style.css" type="text/css">
    <title>HOME</title>
</head>
<body>

<center>

<h1>Tabella Auto</h1>
        <table class="table table-striped mt-5 w-75 ">
            <thead>
                <tr>
                    <th scope="col">Targa</th>
                    <th scope="col">Marca</th>
                    <th scope="col">Modello</th>
                    <th scope="col">Cilindrata</th>
                    <th scope="col">Potenza</th>
                    <th scope="col">CodFiscaleProprietario</th>
                    <th scope="col">CodicePolizza</th>
                </tr>
            </thead>
            <tbody>
                <?php echo $tabella; ?>
            </tbody>
        </table>
    </center>
    
</body>
</html>