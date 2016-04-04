<?php 
$path = 'images/';


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
    mt_srand( (double)microtime() * 1000000 );
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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="style.css">
	<title>CBRC</title>
</head>
<body>
<a name="top"></a>
<div class="container">
	<div class="head">
		<div class="nav">
			<a href="default2.asp"><div class="logo col"></div></a>

			<div class="col">
				<nav>

					<a href="#" class="active">DATABASE</a>
					<a href="guidelines.html">REPORT SIGHTING</a>
					<a href="#">RARE BIRDS</a>
					<a href="#">ANNUAL REPORTS</a>
					<a href="#">ABOUT US</a>

				</nav>
			</div>
			<div class="col">
				<form>
				 	<input class="head-search" type=text name=s placeholder="SEARCH CBRC">
				</form>
			</div>
		</div>
	</div>

	<div class="wrapper">
		<div class="half">
			<h1> Query Database</h1>

			<div class="db-image"><img class="db-image" src="<?php echo $path . $img ?>" alt="" />  </div>

			<p>This is a preliminary form which can be used to query raw data from the CBRC records database. Although this database contains records as early as 1880, certain pre-1997 records may be missing. For a complete accounting of older records through 2004 and selected records through 2006, please refer to the book <i>Rare Birds of California</i> available here.</p>

		</div>

		<div style="padding-top: 23px" class="half">
			<form action="../mydb2.asp"><input type="hidden" name="priv" value="1">
				<h2>SPECIES</h2><input class="search-species" type="text" name="species" placeholder=" Enter Species">
				<h2>LOCATION</h2>
				<select class="search-location"  type="text" name="county">

					<option value="" selected>all counties </option>
					<option value=ala>ala - alameda </option>
					<option value=alp>alp - alpine </option>

					<option value=ama>ama - amador </option>
					<option value=but>but - butte </option>
					<option value=cc>cc - contra costa </option>
					<option value=clv>clv - calaveras </option>
					<option value=col>col - colusa </option>
					<option value=dn>dn - del norte </option>

					<option value=ed>ed - el dorado </option>
					<option value=fre>fre - fresno </option>
					<option value=gle>gle - glenn </option>
					<option value=hum>hum - humboldt </option>
					<option value=imp>imp - imperial </option>
					<option value=iny>iny - inyo </option>

					<option value=ker>ker - kern </option>
					<option value=kin>kin - kings </option>
					<option value=la>la - los angeles </option>
					<option value=lak>lak - lake </option>
					<option value=las>las - lassen </option>
					<option value=mad>mad - madera </option>

					<option value=men>men - mendocino </option>
					<option value=mer>mer - merced </option>
					<option value=mno>mno - mono </option>
					<option value=mod>mod - modoc </option>
					<option value=mrn>mrn - marin </option>
					<option value=mrp>mrp - mariposa </option>

					<option value=mty>mty - monterey </option>
					<option value=nap>nap - napa </option>
					<option value=nev>nev - nevada </option>
					<option value=ora>ora - orange </option>
					<option value=pla>pla - placer </option>
					<option value=plu>plu - plumas </option>

					<option value=riv>riv - riverside </option>
					<option value=sac>sac - sacramento </option>
					<option value=sba>sba - santa barbara </option>
					<option value=sbe>sbe - san bernardino </option>
					<option value=sbt>sbt - san benito </option>
					<option value=scl>scl - santa clara </option>

					<option value=scz>scz - santa cruz </option>
					<option value=sd>sd - san diego </option>
					<option value=sf>sf - san francisco </option>
					<option value=sha>sha - shasta </option>
					<option value=sie>sie - sierra </option>
					<option value=sis>sis - siskiyou </option>

					<option value=sj>sj - san joaquin </option>
					<option value=slo>slo - san luis obispo </option>
					<option value=sm>sm - san mateo </option>
					<option value=sol>sol - solano </option>
					<option value=son>son - sonoma </option>
					<option value=sta>sta - stanislaus </option>

					<option value=sut>sut - sutter </option>
					<option value=teh>teh - tehama </option>
					<option value=tri>tri - trinity </option>
					<option value=tul>tul - tulare </option>
					<option value=tuo>tuo - tuolumne </option>
					<option value=ven>ven - ventura </option>

					<option value=yol>yol - yolo </option>
					<option value=yub>yub - yuba </option>
				</select>
				<h2>DATE</h2><input class="search-date" type="text" name="startdate" placeholder="mm/dd/yyyy">
				<input class="search-date" type="text" NAME="enddate" placeholder="mm/dd/yyyy">
				<p class="checkbox" style="text-align:center; margin-right:36px; margin-top:10px;">Check for partial Matches  <input class="checkbox" type="checkbox" name="partial" checked></p>
				<p class="checkbox" style="text-align:center; margin-right:36px">Accepted Records Only  <input class="checkbox" type="checkbox" name="accepted"></p>
				<input type="submit" class="button" value="Query the Database">
			</form>
		</div>
	</div>

	<div class="push"></div>
</div>

	<div class="footer-bar">
	<div class="footer">
			<footer>
				<a href="#">donate</a>
				<a href="#">webmaster</a>
				<a href="#">contact us</a>
				<a href="#top">Back to Top &#8593;</a>
			</footer>
	</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

</body>
</html>
