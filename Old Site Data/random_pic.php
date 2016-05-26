<?php

/////////////////////////////////////////////////////////////////////
// This is the only portion of the code you may need to change.
// Indicate the location of your images
//$root = 'root/';
// use if specifying path from root
//$root = $_SERVER['DOCUMENT_ROOT'];

$path = 'images/';

// End of user modified section
/////////////////////////////////////////////////////////////////////

function getImagesFromDir($path) {
    $images = array();
    if ( $img_dir = @opendir($path) ) {
        while ( false !== ($img_file = readdir($img_dir)) ) {
            // checks for gif, jpg, png
            if ( preg_match("/(\.gif|\.jpg|\.png)$/", $img_file) ) {
                $images[] = $img_file;
            }
        }
        closedir($img_dir);
    }
    return $images;
}

function getRandomFromArray($ar) {
    mt_srand( (double)microtime() * 1000000 ); // php 4.2+ not needed
    $num = array_rand($ar);
    return $ar[$num];
}


// Obtain list of images from directory
$imgList = getImagesFromDir($path);

$img = getRandomFromArray($imgList);
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Demo</title>
<style type="text/css">
body { font: 14px/1.3 verdana, arial, helvetica, sans-serif; }
h1 { font-size:1.3em; }
h2 { font-size:1.2em; }
a:link { color:#33c; }
a:visited { color:#339; }
p { max-width: 60em; }

/* so linked image won't have border */
a img { border:none; }
</style>
</head>
<body>

<h1>Display Random Image Using PHP</h1>

<p><p>Each time the page is loaded an image will be selected at random. When you add more images to select from, you are less likely to get repeats from one page load to the next. </p></p>

<!-- image displays here -->
<div><img src="<?php echo $path . $img ?>" alt="" /></div>


<p>&nbsp;</p>

<p>Find information on setup <a href="http://www.dyn-web.com/code/basics/random_image/random_img_php.php">online</a>.</p>

<p>Thank you for visiting <a href="http://www.dyn-web.com/">dyn-web.com</a>!</p>

</body>
</html>