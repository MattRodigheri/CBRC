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
response.write "<html><head><title>CBRC Record Contributors</title></head><body>"
If oRS.EOF Then
	response.write("<b><big>Not the ID of an accepted record.</big></b>")
Else
	response.write("<b><font size=+1 color=#000080>" + oRS.Fields.Item("Species") + " (" + oRS.Fields.Item("Record") + ")</font></b><br>")
	response.write("Contributing photographers indicated by (ph.)<br>")
	oRS.close
	Set oRS = oConn.Execute("SELECT IO, Report.Observer, LastName, COUNT(Slides OR Photos) AS Pics FROM Report LEFT JOIN Addresses ON Report.Observer = Addresses.Observer WHERE Record = '" & record & "' GROUP BY IO, Report.Observer, LastName ORDER BY IO, LastName")
	dispInit = true
	dispCorr = true
	While Not oRS.EOF
		If oRS.Fields.Item("Observer") <> "" Then
			If oRS.Fields.Item("IO") Then
				If dispInit Then response.write("<br><b><big>Initial observer(s):</big></b><br>")
				dispInit = false
			Else
				If dispCorr Then response.write("<br><b><big>Corroborating observers and additional sources:</big></b><br>")
				dispCorr = false
			End If
			response.write(oRS.Fields.Item("Observer"))
			If oRS.Fields.Item("Pics") Then response.write(" (ph.)")
			response.write("<br>")
		End If
		oRS.movenext
	Wend
	If dispInit And dispCorr Then response.write("<br><b><big>No observer information available.</big></b><br>")
End If
response.write "</body></html>"
oRS.close
Set oRs = nothing
oConn.Close
Set oConn = nothing

response.write("<br><a href=""javascript:close()"">Close this window</a>")

%> 