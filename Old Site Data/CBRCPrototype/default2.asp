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

				<a href="cbrcdb2.html">DATABASE</a>
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
		<h1>News</h1>
		<div class="news-iamge"> </div>
		<h2>3 October 2015</h2>
		<ul>
		<li><p>Added Common Scoter <i>Melanitta nigra</i> to the main and review lists.</p></li>
		</ul>
		<h2>2 July 2015</h2>
		<ul>
		<li><p>Updated names, list sequence, and taxonomy to conform to the 56th supplement of the AOU Check-List</p></li>
		</ul>
		<h2>26 January 2015</h2>
		<ul>
		<li><p>Replaced Taiga/Tundra Bean-Goose <i>Anser fabalis/serrirostris</i> with Tundra Bean-Goose <i>Anser serrirostris</i> on the main and review lists.</p></li>

		<li><p>Added Taiga/Tundra Bean-Goose <i>Anser fabalis/serrirostris</i> to the appended species groups on the review list.</p></li>

		<li><p>Replaced Frigatebird sp. <i>Fregata sp.</i> with Magnificent/Great/Lesser Frigatebird <i>Fregata magnificens/minor/ariel</i> to the appended species groups on the review list.</p></li>

		</ul>
	<p><a href="#">Read More »</a></p>
	</div>
	<div class="half">
		<h1>Quick Query</h1><p style="color:#307984; margin-top:-16px">Last updated <%Set fso = Server.CreateObject("Scripting.FileSystemObject")
If fso.FileExists(Server.MapPath("../access_db\CBRC.mdb")) Then
	dbdate = fso.GetFile(Server.MapPath("../access_db\CBRC.mdb")).DateLastModified
	Response.Write(Day(dbdate) & " " & MonthName(Month(dbdate)) & " " & Year(dbdate))
End If
%></p>
		<form action="../mydb2.asp">
		<input type="text" class="search-species" name="species" placeholder=" Enter Species">
		<input class="partial-search" type="checkbox" name="partial" checked style="visibility:hidden">
		<input type="submit" class="button" value="Query the Database">
		
		<h1>Reporting guidelines</h1>
		<ul>
		<li><p>Report only species which are on the cbrc review </br>
		list or which are new to california.</p></li>
		<li><p>All reports must include the species, location, date</br>
		 of the observation, and the name of the observer.</p></li>
		</ul>
		<a href="http://www.californiabirds.org/CBRCPrototype/guidelines.html">
		<input type="button" class="button" value="Report Sighting">
		</a>
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
</div>
</body>
</html>