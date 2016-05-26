<%
Class BirdList
	Public list
	Public modified
	Public total
	Public countRev
	Public countI
	Public countE
	Public countRI
	Public countNoSpec
	Public countP
	Public countV
	Public countA
	Public countS

	Sub Load(listFile, reviewListOnly)
		Dim fs, fo, f, order, orderPending, family, familyPending, line, species, flags, pos, included
		Set fs = Server.CreateObject("Scripting.FileSystemObject")
		Set fo = fs.GetFile(listFile)
		modified = fo.DateLastModified
		Set f = fs.OpenTextFile(listFile)
		Do Until f.AtEndOfStream
			line = f.ReadLine
			If Left(Line, 1) <> vbTab Then
				order = line
				orderPending = True
			ElseIf Mid(Line, 2, 1) <> vbTab Then
				family = Mid(Line, 2)
				familyPending = True
			Else
				species = Mid(Line, 3)
				pos = InStr(species, " - ")
				flags = ""
				If pos Then
					flags = Mid(species, pos + 3)
					species = Left(species, pos - 1)
				End If

				included = True
				If reviewListOnly Then
					' Only include species that are on the review list.
					If InStr(flags, "*") = 1 Then
						' Don't display the review list flag (*); it's implied
						flags = Mid(flags, 2)
					Else
						included = False
					End If
				End If

				If included Then
					If familyPending Then
						list = list & "<BR>" & vbCrLf
						If orderPending Then
							list = list & "<DIV CLASS=order>" & order & "</DIV>" & vbCrLf
							orderPending = False
						End If
						list = list & "<DIV CLASS=family>" & family & "</DIV>" & vbCrLf
						familyPending = False
					End If
					species = Replace(species, "(", "<I>")
					species = Replace(species, ")", "</I>")
					If Len(flags) Then
						species = species & " - " & flags
						If InStr(flags, "*") Then countRev = countRev + 1
						If InStr(flags, "I") Then countI = countI + 1
						If InStr(flags, "E") Then countE = countE + 1
						If InStr(flags, "RI") Then countRI = countRI + 1: countI = countI - 1
						If InStr(flags, "P") Or InStr(flags, "V") Or InStr(flags, "A") Or InStr(flags, "S") Then
							countNoSpec = countNoSpec + 1
							If InStr(flags, "P") Then countP = countP + 1
							If InStr(flags, "V") Then countV = countV + 1
							If InStr(flags, "A") Then countA = countA + 1
							If InStr(flags, "S") Then countS = countS + 1
						End If
					End If
					list = list & "<DIV CLASS=species>" & species & "</DIV>" & vbCrLf
					total = total + 1
				End If
			End If
		Loop
		f.Close
		Set f = Nothing
		Set fo = Nothing
		Set fs = Nothing
	End Sub
End Class

Function Max(x, y)
	If x > y Then Max = x Else Max = y
End Function

Function TextDate(date)
	TextDate = CStr(Day(date)) & " " & MonthName(Month(date)) & " " & CStr(Year(date))
End Function

' Get the English word for a number
Function TextNum(n)
	If n >= 0 And n <= 10 Then
		TextNum = Array("zero","one","two","three","four","five","six","seven","eight","nine","ten")(n)
	Else
		' Too high, just show it in digits
		TextNum = CStr(n)
	End If
End Function
%>
