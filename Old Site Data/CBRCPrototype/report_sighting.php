<?php
if($_POST)
{
  $to_email     = "secretary@californiabirds.org"; //Recipient email
  $from_email 	= $_POST["email"]; //From email address
    //check if its an ajax request, exit if not
    if(!isset($_SERVER['HTTP_X_REQUESTED_WITH']) AND strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) != 'xmlhttprequest') {
        $output = json_encode(array( //create JSON data
            'type'=>'error',
            'text' => 'Sorry Request must be Ajax POST'
        ));
        die($output); //exit script outputting json data
    }
    //Sanitize input data using PHP filter_var().
    $species        = filter_var($_POST["species"], FILTER_SANITIZE_STRING);
    $firstDate      = filter_var($_POST["firstDate"], FILTER_SANITIZE_STRING);
    $lastDate       = filter_var($_POST["lastDate"], FILTER_SANITIZE_STRING);
    $number         = filter_var($_POST["number"], FILTER_SANITIZE_STRING);
    $county         = filter_var($_POST["county"], FILTER_SANITIZE_STRING);
    $name           = filter_var($_POST["name"], FILTER_SANITIZE_STRING);
    $email          = filter_var($_POST["email"], FILTER_SANITIZE_EMAIL);
    $location       = filter_var($_POST["location"], FILTER_SANITIZE_STRING);
    $others         = filter_var($_POST["others"], FILTER_SANITIZE_STRING);
    $opticals       = filter_var($_POST["opticals"], FILTER_SANITIZE_STRING);
    $time           = filter_var($_POST["time"], FILTER_SANITIZE_STRING);
    $recorded       = filter_var($_POST["recorded"]);
    $certain        = filter_var($_POST["certain"]);
    $sightingdescription    = filter_var($_POST["sightingdescription"], FILTER_SANITIZE_STRING);
    $subject  = "Sighting Report";
    //email body
    $message_body =
    "<html><body style='color: #307984;'>
    <h2>A copy of this sighting report has been sent to the CBRC Secretary</h2><br><br>
    <span style='font-size: 14px'><strong>Species:</strong></span><span style='color: black'> $species</span><br><br>
    <span style='font-size: 14px'><strong>Date First Seen:</strong></span><span style='color: black'> $firstDate</span><br><br>
    <span style='font-size: 14px'><strong>Date Last Seen:</strong></span><span style='color: black'> $lastDate</span><br><br>
    <span style='font-size: 14px'><strong>Number of Birds:</strong></span><span style='color: black'> $number</span><br><br>
    <span style='font-size: 14px'><strong>County:</strong></span><span style='color: black'> $county</span><br><br>
    <span style='font-size: 14px'><strong>Name:</strong></span><span style='color: black'> $name</span><br><br>
    <span style='font-size: 14px'><strong>Email:</strong></span><span style='color: black'> $email</span><br><br>
    <span style='font-size: 14px'><strong>Location:</strong></span><span style='color: black'> $location</span><br><br>
    <span style='font-size: 14px'><strong>Other Observers:</strong></span><span style='color: black'> $others</span><br><br>
    <span style='font-size: 14px'><strong>Optical Aids:</strong></span><span style='color: black'> $opticals</span><br><br>
    <span style='font-size: 14px'><strong>Length of Time Viewed:</strong></span><span style='color: black'> $time</span><br><br>
    <span style='font-size: 14px'><strong>Was the bird photographed or voice recorded?:</strong></span><span style='color: black'> $recorded</span><br><br>
    <span style='font-size: 14px'><strong>Is the identification 100% certain?:</strong></span><span style='color: black'> $certain</span><br><br>
    <span style='font-size: 14px'><strong>Sighting Description:</strong></span><span style='color: black'> $sightingdescription</span><br><br>
    </body></html>";
	### Attachment Preparation ###
	$file_attached = false;
	if(isset($_FILES['file_attach'])) //check uploaded file
	{
		//get file details we need
		$file_tmp_name 	  = $_FILES['file_attach']['tmp_name'];
		$file_name 		  = $_FILES['file_attach']['name'];
		$file_size 		  = $_FILES['file_attach']['size'];
		$file_type 		  = $_FILES['file_attach']['type'];
		$file_error 	  = $_FILES['file_attach']['error'];
		//exit script and output error if we encounter any
		if($file_error>0)
		{
			$mymsg = array(
			1=>"The uploaded file exceeds the upload_max_filesize directive in php.ini",
			2=>"The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form",
			3=>"The uploaded file was only partially uploaded",
			4=>"No file was uploaded",
			6=>"Missing a temporary folder" );
			$output = json_encode(array('type'=>'error', 'text' => $mymsg[$file_error]));
			die($output);
		}
		//read from the uploaded file & base64_encode content for the mail
		$handle = fopen($file_tmp_name, "r");
        $content = fread($handle, $file_size);
        fclose($handle);
		$encoded_content = chunk_split(base64_encode($content));
		//now we know we have the file for attachment, set $file_attached to true
		$file_attached = true;
	}
	if($file_attached) //continue if we have the file
	{
		$boundary = md5("sanwebe");
		//header
		$headers = "MIME-Version: 1.0\r\n";
		$headers .= "From:".$from_email."\r\n";
		$headers .= "Reply-To: ".$user_email."" . "\r\n";
		$headers .= "Content-Type: multipart/mixed; boundary = $boundary\r\n\r\n";
		//html
		$body = "--$boundary\r\n";
		$body .= "Content-Type: text/html; charset=UTF-8\r\n";
		$body .= "Content-Transfer-Encoding: base64\r\n\r\n";
		$body .= chunk_split(base64_encode($message_body));
		//attachment
		$body .= "--$boundary\r\n";
		$body .="Content-Type: $file_type; name=\"$file_name\"\r\n";
		$body .="Content-Disposition: attachment; filename=\"$file_name\"\r\n";
		$body .="Content-Transfer-Encoding: base64\r\n";
		$body .="X-Attachment-Id: ".rand(1000,99999)."\r\n\r\n";
		$body .= $encoded_content;
	} else {
    $boundary = md5("sanwebe");
		//header
		$headers = "MIME-Version: 1.0\r\n";
		$headers .= "From:".$from_email."\r\n";
		$headers .= "Reply-To: ".$user_email."" . "\r\n";
		$headers .= "Content-Type: multipart/mixed; boundary = $boundary\r\n\r\n";
		//html
		$body = "--$boundary\r\n";
		$body .= "Content-Type: text/html; charset=UTF-8\r\n";
		$body .= "Content-Transfer-Encoding: base64\r\n\r\n";
		$body .= chunk_split(base64_encode($message_body));
	}
	$send_mail = mail($to_email, $subject, $body, $headers);
  $send_mail = mail($from_email, $subject, $body, $headers);
    if(!$send_mail)
    {
        //If mail couldn't be sent output error. Check your PHP email configuration (if it ever happens)
        $output = json_encode(array('type'=>'error', 'text' => 'Could not send mail! Please check your PHP mail configuration.'));
        die($output);
    }else{
        $output = json_encode(array('type'=>'message', 'text' => 'Hi '.$user_name .' Thank you for your email'));
        die($output);
    }
}
?>
