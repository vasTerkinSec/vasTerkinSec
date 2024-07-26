<html lang="en">

<head>
    <title>Our best students</title>
    <link rel="stylesheet" href="style.css" type="text/css" />
</head>

<body>
    <h1><center>Our best students</center></h1>
    <table>
<?php
$mysqli = new mysqli("wizard-db-service", getenv("WIZARD_DB_USERNAME"), getenv("MYSQL_ROOT_PASSWORD"), getenv("WIZARD_DB_NAME"));
$wizards = $mysqli->query("SELECT * FROM wizards");
$instrument = $mysqli->query("SELECT * FROM magic_instrument");
foreach ($wizards as $name) {
    $row = $instrument->fetch_assoc();
    echo " <h2><center>
        <FONT COLOR=BLUE>{$name['wizards_name']}</FONT>, 
        he have <FONT COLOR=GREEN>{$row['type_of_instrument']}</FONT>, 
        which can do <FONT COLOR=RED>{$row['type_of_magic']}</FONT>.
        </center></h2>
        \n";
} ?>
    </table>
<?php
    phpinfo();
?>
</body>

</html>
