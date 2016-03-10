<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="../CBRCPrototype/style.css">
</head>
<body>
<div class="container">
	<div class="head">
		<div class="nav">
			<a href="../CBRCPrototype/index.html"><div class="logo col"></div></a>
			<div class="col">
				<nav>

					<a href="../CBRCPrototype/cbrcdb2.html">DATABASE</a>
					<a href="#">REPORT SIGHTING</a>
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
	Response.Write "<h1>Invalid date.&nbsp;&nbsp;Please use mm/dd/yyyy. &nbsp;&nbsp;E.g.&nbsp;&nbsp; 04/01/2009 for April 1, 2009.</h1>"
	Response.End
End Sub
%>
</div>


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

<div class="wrapper">
<%
Dim species, county
Set species = request.querystring("species")
Set county = request.querystring("county")

If species = "" And county = "" Then
	response.write "<h1>Please specify at least one species or county. To return, press the back button on your browser.</h1>"
	response.end
End If
%>
</div>

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
	qry = qry & " ORDER BY [First Date]"
End If
%>

<div class="wrapper">
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
	response.write "<h1>No records found.</h1"
Else
	response.write "<h1>Here are the records you requested. Click on record numbers for names of contributors"
	If priv = 0 Then response.write " (not available for unaccepted or withdrawn records)"
	response.write ".</h1>"
%>
</div>

<table border="1" width="100%">
<tr>

<%
count = 0
for each x in oRS.fields
    response.write("<th>" & x.name & "</th>")
next%>

<tr class="rowes">

<%
  count = 0
	While Not oRS.EOF%>
	<tr class="rows">
	<%For each x in oRS.fields
			response.write "<td>"%>
			
			<%If x.name = "Record" Then
			
				response.write("")
				If priv Or (oRS.Fields.Item("Status") <> "R" And oRS.Fields.Item("Status") <> "W") Then
					response.write("<a href=""mydbobservers.asp?record=" & x.value)
					If priv Then response.write("&anystatus=1")
					response.write(""" onClick=""open(this, '_blank', 'width=640,height=480'); return false"">" & x.value &  "</a>")
				Else
					response.write(x.value)
				End If
			ElseIf x.value <> "" Then
				response.write( x.value)
			
			End If
			
		Next
		response.write "</td>"
		oRS.movenext
		count = count + 1

	Wend
REM response.write "<h6>There were " + CStr(count) + " records matching your query.</h6>"

	
End If
oRS.close

Set oRs = nothing
oConn.Close
Set oConn = nothing
%> 
</tr>
</tr>
</table>
	<div class="push"></div>
</div>
	<div class="footer-bar">
		<div class="footer">
			<footer>
				<a href="#">DONATE</a>
				<a href="#">WEBMASTER</a>
				<a href="#">CONTACT US</a>
			</footer>
		</div>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
s

</html>
</body>