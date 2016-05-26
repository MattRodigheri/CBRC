<%
Dim record
Set record = request.querystring("record")

record = Replace(record, "'", "''")

Dim oConn, oRs
Dim qry, connectstr
Dim db_path
Dim db_dir
db_dir = Server.MapPath("access_db") & "\"
db_path = db_dir & "CBRC.mdb"

connectstr = "Driver={Microsoft Access Driver (*.mdb)};DBQ=" & db_path

Set oConn = Server.CreateObject("ADODB.Connection")
oConn.Open connectstr

qry = "SELECT Record, Species FROM Record WHERE Record = '" & record & "'"
If request.querystring("anystatus") <> "1" Then qry = qry & "AND Status <> 'R' AND Status <> 'W'"
Set oRS = oConn.Execute(qry)


If oRS.EOF Then
	response.write("<h2>Not the ID of an accepted record.</h2>")
Else
	response.write("<h2>" + oRS.Fields.Item("Species") + " (" + oRS.Fields.Item("Record") + ")</h2>")
	response.write("<p>Contributing photographers indicated by (ph.)</p>")
	oRS.close
	Set oRS = oConn.Execute("SELECT IO, Report.Observer, LastName, COUNT(Slides OR Photos) AS Pics FROM Report LEFT JOIN Addresses ON Report.Observer = Addresses.Observer WHERE Record = '" & record & "' GROUP BY IO, Report.Observer, LastName ORDER BY IO, LastName")
	dispInit = true
	dispCorr = true
	While Not oRS.EOF
		If oRS.Fields.Item("Observer") <> "" Then
			If oRS.Fields.Item("IO") Then
				If dispInit Then response.write("<h2>Initial observer(s):</h2>")
				dispInit = false
			Else
				If dispCorr Then response.write("<h2>Corroborating observers and additional sources:</h2>")
				dispCorr = false
			End If
			response.write("<p>" + oRS.Fields.Item("Observer") )
			If oRS.Fields.Item("Pics") Then response.write(" (ph.)</p>")

			Else response.write("</p>")
		End If
		oRS.movenext
	Wend
	If dispInit And dispCorr Then response.write("<h2>No observer information available.</h2>")
End If


oRS.close
Set oRs = nothing
oConn.Close
Set oConn = nothing


%> 	