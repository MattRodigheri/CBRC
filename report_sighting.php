<?php
$msg = "SIGHTING REPORT\n\n";
$msg .= "Species:    $_POST[species]\n";
$msg .= "Date of Observation:    $_POST[date]\n";
$msg .= "Location:       $_POST[location]\n";
$msg .= "Sighting Description:              $_POST[description]\n";
$msg .= "Name of Observer:       $_POST[name]\n\n";
$to = "mrodighe@mail.ccsf.edu";
$subject = "Form Feedback Test";
mail($to, $subject, $msg);
?>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">

<title>Sighting Reported</title>

<style>

body {background-color: blue;}

#contents {

	margin: 0px auto; padding: 15px;
        text-align: left; /* Counteract to IE/Win Hack */
        width: 630px; background-color: lightblue;}

</style>

</head>

<body>

<section>

<br><br>

<div id="contents">

<h3>Thank you, your sighting has been sent for approval</h3>

<!-- <p><b>Your Name: </b>
<?php echo "$_POST[name]"; ?>
<br><br>

<b>Your Car Model: </b>
<?php echo "$_POST[car]"; ?>
<br><br>

<b>Your Favorite Color: </b>
<?php echo "$_POST[color]"; ?>
<br><br>

<b>Your Message:</b>
<?php echo "$_POST[message]"; ?>
</p>

</div> -->

</body>
</html>
