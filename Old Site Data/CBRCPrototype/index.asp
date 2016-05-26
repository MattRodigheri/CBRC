<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1 user-scalable=no">
	<link rel="stylesheet" type="text/css" href="index.css">
	<script src="index.js"></script>
	<title>CBRC</title>
</head>
<body>
	<header>
		<div id="hamburger"><a href="javascript:void(0);" onclick="dropMenu()">&#9776;</a></div>
			<ul>
				<!-- <li><a href="default2.asp"><div id="logo"></div></a></li> -->
				<li><a href="index.html" id="active">HOME</a></li>
				<li><a href="cbrcdb2.html">DATABASE</a></li>
				<li><a href="report_sighting.html">REPORT SIGHTING</a></li>
				<li><a href="#">RARE BIRDS</a></li>
				<li><a href="#">ANNUAL REPORTS</a></li>
				<li><a href="#">ABOUT US</a></li>
				<li><form><input class="head-search" type=text placeholder="SEARCH CBRC"></form></li>
			</ul>
	</header>

	<main>
		<aside class="mobile-bottom">
				<h1>News</h1>
				<img class="news-image" src="images/duck.png"></img>

				<h2>3 October 2015</h2>
					<ul>
						<li><p>Added Common Scoter Melanitta nigra to the main and review lists.</p></li>
					</ul>

				<h2>2 July 2015</h2>
					<ul>
						<li><p>Updated names, list sequence, and taxonomy to conform to the 56th supplement of the AOU Check-List</p></li>
					</ul>

				<h2>26 January 2015</h2>
					<ul>
						<li><p>Replaced Taiga/Tundra Bean-Goose Anser fabalis/serrirostris with Tundra Bean-Goose Anser serrirostris on the main and review llists.</p></li>
						<li><p>Added Taiga/Tundra Bean-Goose Anser fabalis/serrirostris to the appended species groups on the review list.</p></li>
						<li><p>Replaced Frigatebird sp. Fregata sp. with Magnificent/Great/Lesser Frigatebird Fregata magnificens/minor/ariel to the appended species groups on the review list.</p></li>
					</ul>
					<br>
				<a href="#">Read More »</a>
		</aside>

		<aside class="right">
				<h1>Quick Query</h1>
				<form class="index-form" action="../mydb2.asp">
					<input class="partial-search" type="checkbox" name="partial" checked style="visibility:hidden">
					<input type="text" class="search-species" name="species" placeholder="Enter Species">
					<button type="submit" class="submit">Query the Database</button>
				</form>

					<h1>Reporting guidelines</h1>
					<ul>
						<li><p>Report only species which are on the cbrc review list or which are new to california.</p></li>
						<li><p>all reports must include the species, locaiton, date of the observation, and the name of the observer.</p></li>
					</ul>
					<a id="report-link" href="report_sighting.html"><button>Report Sighting</button></a>
		</aside>
	</main>

	<footer>
				<ul>
					<li><a href="#">donate</a></li>
					<li><a href="#">webmaster</a></li>
					<li><a href="#">contact us</a></li>
				</ul>
	</footer>

</body>
</html>
