<?php
session_start();
$servername = "localhost";
$username = "mamp";
$password = "";
$database = "verificaSQL";

$conn = mysqli_connect($servername, $username, $password, $database);

$string = "";

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
//echo "Connected successfully";

if (isset($_POST["btninvia"])) {

    $email = $_POST["email"];
    $pw = $_POST["password"];
    $nome = $_POST["nome"];
    $cognome = $_POST["cognome"];

    $email = stripcslashes($email);
    $pw = stripcslashes($pw);
    $nome = stripcslashes($nome);
    $cognome = stripcslashes($cognome);


    $sql = "INSERT INTO `userData`(`nome`, `cognome`, `email`, `pass`) VALUES ('$nome', '$cognome', '$email', '$pw')";

    if (mysqli_query($conn, $sql)) {
        $mess = '<h5 class="mb-3 text-economica" style="background-color: green;">Inserimento effettuato</h5>';
    } else {
        $mess = '<h5 class="mb-3 text-economica" style="background-color: red">Errore: mail già presente</h5>';
    }
}



$conn = null;
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="../CSS/style.css" type="text/css">
    <title>SING UP PAGE</title>
</head>

<div class="div-register w-50 m-auto mt-5">
    <center>
        <span class="text-economica"><?php echo $mess ?></span>
        <h5 class="mb-3">Pagina di registrazione</h5>
    </center>
    <form method="POST" action="register.php">
        <div class="row mb-4">
            <div class="col">
                <div class="form-outline">
                    <input name="nome" type="text" id="form3Example1" class="form-control" required/>
                    <label class="form-label" for="form3Example1">First name</label>
                </div>
            </div>
            <div class="col">
                <div class="form-outline">
                    <input name="cognome" type="text" id="form3Example2" class="form-control" required/>
                    <label class="form-label" for="form3Example2">Last name</label>
                </div>
            </div>
        </div>

        <div class="form-outline mb-4">
            <input name="email" type="email" id="form3Example3" class="form-control" required/>
            <label class="form-label" for="form3Example3">Email address</label>
        </div>

        <div class="form-outline mb-4">
            <input name="password" type="password" id="form3Example4" class="form-control" required/>
            <label class="form-label" for="form3Example4">Password</label>
        </div>

        <center><button type="submit" name="btninvia" class="btn btn-primary btn-block mb-4">Sign up</button></center>

    </form>
</div>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>

</html>