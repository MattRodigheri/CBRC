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
	Response.Write "Invalid date.&nbsp;&nbsp;Please use mm/dd/yyyy. &nbsp;&nbsp;E.g.&nbsp;&nbsp; 04/01/2009 for April 1, 2009."
	Response.End
End Sub

If request.querystring("priv") = "1" Then
	priv = 1
	fields = "*"
	restrictions = ""
Else
	priv = 0
	fields = "Record, Status, Species, Count, [First Date], [Last Date], Location, Co, Co2, Note"
	REM restrictions = " AND ([Record] >= '2004' OR [Decison Date] >= #4/6/2007#)"
End If

Dim species, county
Set species = request.querystring("species")
Set county = request.querystring("county")

If species = "" And county = "" Then
	response.write "<b><big>Please specify at least one species or county. To return, press the back button on your browser.</big></b>"
	response.end
End If

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

Dim oConn, oRs
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
response.write "<html><head><title>CBRC Database Search Results</title></head><body>"
If oRS.EOF Then
	response.write "<b><big>No records found. To return, press the back button on your browser.</big></b>"
Else
	response.write "<b><font size=+1 color=#000080>Here are the records you requested. To return, press the back button on your browser. Click on record numbers for names of contributors"
	If priv = 0 Then response.write " (not available for unaccepted or withdrawn records)"
	response.write ".</font></b>"

	count = 0
	While Not oRS.EOF
		response.write "<p>"
		For each x in oRS.fields
			If x.name = "Record" Then
				response.write(x.name & "=")
				If priv Or (oRS.Fields.Item("Status") <> "R" And oRS.Fields.Item("Status") <> "W") Then
					response.write("<a href=""mydbobservers.asp?record=" & x.value)
					If priv Then response.write("&anystatus=1")
					response.write(""" onClick=""open(this, '_blank', 'width=640,height=480'); return false"">" & x.value & "</a>")
				Else
					response.write(x.value)
				End If
			ElseIf x.value <> "" Then
				response.write(", " & x.name & "=" & x.value)
			End If
		Next
		response.write "</p>"
		oRS.movenext
		count = count + 1
	Wend

	response.write "<b><big>There were " + CStr(count) + " records matching your query.</big></b>"
End If
response.write "</body></html>"
oRS.close

Set oRs = nothing
oConn.Close
Set oConn = nothing

%> 