<?php
session_start();

if(!isset($_SESSION["nominativo"])){
    session_destroy();
    header("Location: ../index.php");
}

$servername = "localhost";
$username = "mamp";
$password = "";
$dbname = "verificaSQL";

$tot = 0;
$utente = $_SESSION["nominativo"];

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
    <link rel="stylesheet" href="../Css/style.css" type="text/css">
    <title>HOME</title>
</head>

<body>
<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0 mr-5">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <?php echo $utente ?>
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Gestisci profilo</a></li>
            <li><a class="dropdown-item" href="#">Another action</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item link-danger" href="logout.php">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.3/apexcharts.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>

</html>