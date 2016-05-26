<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="description" content="This is the table with records matching the request from the database of the California Bird Records Committee (CBRC)">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <title>CBRC</title>
     <link href='https://fonts.googleapis.com/css?family=Lato:400,700,900|Martel:400' rel='stylesheet' type='text/css'> 
    <link rel="stylesheet" href="CBRCPrototype/cbrc_styles.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
     <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
     <script src="CBRCPrototype/report_sighting.js"></script>
    <script src="CBRCPrototype/query_results.js"></script>
    <!-- enable HTML5 in Internet Explorer 8 and earlier by adding following lines-->
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    
   <!-- Header -->
    <!-- ================================================== -->

   
<header>
		<a href="CBRCPrototype/index.html" id="logo"><img src="images/logo.png"></a>
		<div id="hamburger"><a href="#id01" data-popup-open="popup-1" onclick="dropMenu()">&#9776;</a></div>
			<ul>
				<li id="close"><a href="javascript:void(0);" data-popup-close="popup-1" onclick="dropMenu()">&#x2715;</a></li>
				<li><a href="index.html" class="headerlink">HOME</a></li>
				<li><a href="database_query.html" class="headerlink" id="active" >DATABASE</a></li>
				<li>
					<section class="dropdown">
					<a onclick="reportDropdown()" class="dropbtn headerlink">SUBMIT SIGHTING</a>
						<div id="reportDropdown" class="dropdown-content">
							<a href="guidelines_resources.html">Guidelines & Resources</a>
							<a href="report_sighting.html">Report a Sighting</a>
						</div>
					</section>
				</li>
				<li>
					<section class="dropdown">
						<a onclick="listsDropdown()" class="dropbtn headerlink">LISTS</a>
						<div id="listsDropdown" class="dropdown-content">
							<a href="checklist.html">Checklist</a>
							<a href="review_list.html">Review List</a>
                                                        <a href="watchlist.html">Watch List</a>
						</div>
					</section>
				</li>
				<li><a href="CBRCPrototype/reports.html" class="headerlink">REPORTS</a></li>
				<li>
					<section class="dropdown">
					<a onclick="aboutDropdown()" class="dropbtn headerlink">ABOUT</a>
						<div id="aboutDropdown" class="dropdown-content">
							<a href="foundation.html">Foundation</a>
							<a href="CBRCbylaws.html">By-Laws</a>
							<a href="CBRCmembers.html">Members</a>
						</div>
					</section>
				</li>
					<li><a class="search-icon">SEARCH</a></li>
					<div id="white-box"></div>
					<div class="top-search">
						<form method="get" id="searchform" id="searchbox_016348171015647111605:xnnraaq2ers" action="search_results.html">
							<div>
								<input value="016348171015647111605:xnnraaq2ers" name="cx" type="hidden">
								<input value="FORID:11" name="cof" type="hidden">
								<input type="text" name="s" id="search-input">
								<input type="submit" id="searchsubmit" value="">
							</div>
						</form>
					</div>
			</ul>
	</header>

    
<!-- MAIN SECTION -->
<!-- ================================================== -->
  
    
<main class="table-wrapper">
<%
Sub CheckDate(dateStr)
	Set dateRegex = New RegExp
	dateRegex.Pattern = "^(\d{1,2})/(\d{1,2})/(\d{1,4})$"
	Set matches = dateRegex.Execute(dateStr)
	If matches.Count Then
		m = CInt(matches(0).SubMatches(0))
		d = CInt(matches(0).SubMatches(1))
		y = CInt(matches(0).SubMatches(2))
		If m >= 1 And m <= 12 Then
			If m = 2 Then
				maxDay = 28 - (y Mod 4 = 0 And y Mod 100 <> 0 Or y Mod 400 = 0)
			Else 
				maxDay = 30 - (m = 4 Or m = 6 Or m = 9 Or m = 11)
			End If
			If d >= 1 And d <= maxDay Then Exit Sub
		End If
	End If
	Response.Write "<h2>Invalid date.&nbsp;&nbsp;Please use mm/dd/yyyy. &nbsp;&nbsp;E.g.&nbsp;&nbsp; 04/01/2009 for April 1, 2009.</h2>"
	Response.End
End Sub
%>


<%
If request.querystring("priv") = "1" Then
	priv = 1
	fields = "*"
	restrictions = ""
Else
	priv = 0
	fields = "Record, Status, Species, Count, [First Date], [Last Date], Location, Co, Co2, Note"
	REM restrictions = " AND ([Record] >= '2004' OR [Decison Date] >= #4/6/2007#)"
End If
%>

  

<%
Dim species, county
Set species = request.querystring("species")
Set county = request.querystring("county")

If species = "" And county = "" Then
	response.write"<h2>Please specify at least one species or county. To return, press the back button on your browser.</h2>"
	response.end
End If
%>


<%
species = RTrim(Replace(species, "'", "''"))
county = Replace(county, "'", "''")
qry = "SELECT " + fields + " FROM Record"
If request.querystring("partial") <> "" Then
	qry = qry & " WHERE Species LIKE '%" & species & "%'"
Else
	qry = qry & " WHERE Species='" & species & "'"
End If
If county <> "" Then
	qry = qry & " AND (Co = '" & county & "' OR Co2 = '" & county & "')"
End If

If request.querystring("accepted") <> "" Then
	qry = qry & " AND Status='A'"
End If

'qry = qry & " AND [First Date] >= #1/1/2004#"

qry = qry & restrictions

startdate = request.querystring("startdate")
If startdate <> "" Then
	CheckDate startdate
	qry = qry & " AND ([First Date] >= #" & startdate & "# OR [Last Date] >= #" & startdate & "#)"
End If

enddate = request.querystring("enddate")
If enddate <> "" Then
	CheckDate enddate
	qry = qry & " AND [First Date] <= #" & enddate & "#"
End If

If request.querystring("sort") = "month" Then
	qry = qry & " ORDER BY FORMAT([First Date], 'mmdd')"
ElseIf request.querystring("sort") = "date" Then
	qry = qry & " ORDER BY [First Date] DESC" 
End If
%>


<%
Dim oConn, oRS
Dim qry, connectstr
Dim db_path
Dim db_dir
db_dir = Server.MapPath("access_db") & "\"
db_path = db_dir & "CBRC.mdb"
tablename = "[Record]"

connectstr = "Driver={Microsoft Access Driver (*.mdb)};DBQ=" & db_path

Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open connectstr

Set oRS = oConn.Execute(qry)

If oRS.EOF Then
        response.write "<h2>No records found.</h2>"
Else
      

%>


    
<table id="database-table">
<thead> 
<tr>

<%
count = 0
for each x in oRS.fields
    response.write("<th>" & x.name & "</th>")
next%>

</tr>
</thead> 
    
<tbody>

<%
  count = 0
	While Not oRS.EOF%>
    
	<tr> 
        
	<%For each x in oRS.fields
			response.write "<td data-label=""" + x.name + """>"%>
			
			<%If x.name = "Record" Then
			
				response.write("")
				If priv Or (oRS.Fields.Item("Status") <> "R" And oRS.Fields.Item("Status") <> "W") Then
					response.write("<a href=""displayContributors.asp?record=" & x.value)
					If priv Then response.write("&anystatus=1")
                        response.write(""">" & x.value &  "</a></td>")
				Else
					response.write(x.value & "</td>")
				End If
			Else
				response.write(x.value & "</td>")
			
			End If
			
		Next

        response.write "</tr>" 
		oRS.movenext
		count = count + 1

	Wend

   If species <> "" Then
       response.write "<h2>Here are " +  CStr(count) + " records matching your request for " + species + ".</h2>"
   Else
       response.write "<h2>Here are " +  CStr(count) + " records matching your request.</h2>"
    End If

   response.write "<p class='table-subheading'>Click on record numbers for names of contributors.</p>"
   response.write "<p class='table-subheading2'>Mouse over status and county codes for explanation.</p>"
	 
End If
oRS.close

Set oRs = nothing
oConn.Close
Set oConn = nothing
%> 
</tbody>
</table>
</main>

    
<!-- Footer -->
<!-- ================================================== -->
    
<footer>
    <ul>
       <li><a href="https://www.westernfieldornithologists.org/support.php">donate</a></li>
	<li><a href="mailto:webmaster@californiabirds.org">webmaster</a></li>
	<li><a href="mailto:secretary@californiabirds.org">contact us</a></li>
    </ul>
</footer>

<div class="popup" data-popup="popup-1"></div>


</body>		
</html>