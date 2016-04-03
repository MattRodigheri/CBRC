<?php
// Here we get all the information from the fields sent over by the form.
$msg = "SIGHTING REPORT\n\n";
$msg .= "Species:    $_POST[species]\n";
$msg .= "Date & Time First Seen:    $_POST[firstDate]\n";
$msg .= "Date & Time Last Seen:    $_POST[lastDate]\n";
$msg .= "Number of Birds:    $_POST[number]\n";
$msg .= "County:    $_POST[county]\n";
$msg .= "Name of Observer:       $_POST[name]\n";
$msg .= "Email of Observer:       $_POST[email]\n";
$msg .= "Address of Observer:    $_POST[address]\n";
$msg .= "Other Observers:    $_POST[others]\n";
$msg .= "Optical Aids:    $_POST[opticals]\n";
$msg .= "Length of Time Viewed:    $_POST[time]\n";
$msg .= "Photographed/Recorded:    $_POST[recorded]\n";
$msg .= "100% Certain?:    $_POST[certain]\n";
$msg .= "Description:    $_POST[description]\n";

$to = "mrodighe@mail.ccsf.edu";
$cc = "$_POST[email]";
$subject = "Sighting Report";
mail($to, $subject, $msg);
mail($cc, $subject, $msg);
echo "THANK YOU FOR YOUR SUBMISSION"; // success message

?>
