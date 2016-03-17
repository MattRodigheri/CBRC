<?php
// Here we get all the information from the fields sent over by the form.
$msg = "SIGHTING REPORT\n\n";
$msg .= "Species:    $_POST[species]\n";
$msg .= "Date of Observation:    $_POST[date]\n";
$msg .= "Location:       $_POST[location]\n";
$msg .= "Sighting Description:              $_POST[description]\n";
$msg .= "Name of Observer:       $_POST[name]\n";
$msg .= "Email of Observer:       $_POST[email]\n\n";
$to = "mrodighe@mail.ccsf.edu";
$subject = "Sighting Report";
mail($to, $subject, $msg);

echo "THANK YOU FOR YOUR SUBMISSION"; // success message

?>
