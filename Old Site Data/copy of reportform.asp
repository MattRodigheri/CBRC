<!--METADATA TYPE="typelib" UUID="CD000000-8B95-11D1-82DB-00C04FB1625D" 
  NAME="CDO for Windows Library" -->
<!--METADATA TYPE="typelib" UUID="00000205-0000-0010-8000-00AA006D2EA4" 
  NAME="ADODB Type Library" -->
<% 
  if Request("submit") <> "" then 
      Dim objCDO 
      Set objCDO      = Server.CreateObject("CDO.Message") 
      Dim objCDOConf 

      Set objCDOConf  = Server.CreateObject("CDO.Configuration") 
      With objCDOConf.Fields 
          .Item(cdoSendUsingMethod) = 2 
          .Item(cdoSMTPServer) = "mail-fwd" 
          .Item(cdoSMTPServerPort) = 25 
          .Item(cdoSMTPconnectiontimeout) = 10 
          .Update 
      End With
      Set objCDO.Configuration = objCDOConf 
      ' Be sure to use a valid email addresses below: 
      objCDO.From     = "wfo@wfo-cbrc.org" 
      objCDO.To       = "guymcc@pacbell.net"  
      objCDO.Subject  = "Rare Bird Report" 
      objCDO.TextBody = "California Rare Bird Report" 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Species: " 
      objCDO.TextBody = objCDO.TextBody & Request("Species") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Other species: " 
      objCDO.TextBody = objCDO.TextBody & Request("Other species") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Number, sex, age, general plumage: " 
      objCDO.TextBody = objCDO.TextBody & Request("Number, sex, age, general plumage") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "County: " 
      objCDO.TextBody = objCDO.TextBody & Request("County") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Locality: " 
      objCDO.TextBody = objCDO.TextBody & Request("Locality") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Date(s) seen: " 
      objCDO.TextBody = objCDO.TextBody & Request("Date(s) seen") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Time seen: " 
      objCDO.TextBody = objCDO.TextBody & Request("Time seen") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Reporting observer: " 
      objCDO.TextBody = objCDO.TextBody & Request("Reporting observer") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Address: " 
      objCDO.TextBody = objCDO.TextBody & Request("Address") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "City: " 
      objCDO.TextBody = objCDO.TextBody & Request("City") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "State: " 
      objCDO.TextBody = objCDO.TextBody & Request("State") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Zip: " 
      objCDO.TextBody = objCDO.TextBody & Request("Zip") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Phone: " 
      objCDO.TextBody = objCDO.TextBody & Request("Phone") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Fax: " 
      objCDO.TextBody = objCDO.TextBody & Request("Fax") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "E-mail: " 
      objCDO.TextBody = objCDO.TextBody & Request("E-mail") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Other observers: " 
      objCDO.TextBody = objCDO.TextBody & Request("Other observers") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Original finder(s): " 
      objCDO.TextBody = objCDO.TextBody & Request("Original finder(s)") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Light conditions: " 
      objCDO.TextBody = objCDO.TextBody & Request("Light conditions") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Optical equipment: " 
      objCDO.TextBody = objCDO.TextBody & Request("Optical equipment") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Distance: " 
      objCDO.TextBody = objCDO.TextBody & Request("Distance") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Duration of observation: " 
      objCDO.TextBody = objCDO.TextBody & Request("Duration of observation") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Habitat: " 
      objCDO.TextBody = objCDO.TextBody & Request("Habitat") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Behavior: " 
      objCDO.TextBody = objCDO.TextBody & Request("Behavior") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Description: " 
      objCDO.TextBody = objCDO.TextBody & Request("Description") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Voice: " 
      objCDO.TextBody = objCDO.TextBody & Request("Voice") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Similar species: " 
      objCDO.TextBody = objCDO.TextBody & Request("Similar species") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Photographs: " 
      objCDO.TextBody = objCDO.TextBody & Request("Photographs") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Previous experience: " 
      objCDO.TextBody = objCDO.TextBody & Request("Previous experience") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "References consulted during observation: " 
      objCDO.TextBody = objCDO.TextBody & Request("References consulted during observation") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "References consulted after observation: " 
      objCDO.TextBody = objCDO.TextBody & Request("References consulted after observation") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Notes during observation: " 
      objCDO.TextBody = objCDO.TextBody & Request("Notes during observation") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Notes immediately after observation: " 
      objCDO.TextBody = objCDO.TextBody & Request("Notes immediately after observation") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Notes from memory: " 
      objCDO.TextBody = objCDO.TextBody & Request("Notes from memory") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Are you positive?: " 
      objCDO.TextBody = objCDO.TextBody & Request("Are you positive?") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.TextBody = objCDO.TextBody & "Why not positive: " 
      objCDO.TextBody = objCDO.TextBody & Request("Why not positive") 
      objCDO.TextBody = objCDO.TextBody & chr(10) & chr(13) 
      objCDO.Send 
      
      'Clean-up 
      Set objCDO     = Nothing  
      Set objCDOConf = Nothing  
      
      ' Happy response. If you would rather, 
      ' change the following to 
      ' Response.Redirect "thanks.html" or similar 
      Response.Write "Thank you for submitting your report. It has been sent to the Secretary. If you wish to submit another report, you can click your browser's 'Back' button and edit the fields on the Report Form."  
      Response.End 
  end if 
%> 

<html>
  <BODY BACKGROUND="ltgray.gif" BGCOLOR="#E6E6E6" LINK="#000099" VLINK="#666666">
  <form action="/gdform.php" method="post">
  <!--<form action="_gdForm/webformmailer.asp" method="post">-->
    <!--<form method=POST action="<%=Request.ServerVariables("URL")%>">-->
  <input type="hidden" name="redirect" value="thankyou.html" />
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="580">
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD>
			<P><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" VSPACE="15"><BR>
			<IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"><IMG SRC="wagtail4.gif" WIDTH="150"
			HEIGHT="80" ALIGN="BOTTOM" ALT="CBRC Logo by Tim Manolis" BORDER="0"><BR>
			<IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" VSPACE="6"></P>
			<div align="CENTER">
<B><FONT SIZE="6">CBRC Report Form</FONT></B>
</div>
<IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="12" VSPACE="18">In general the committee
			accepts rarity documentation in any written form the reporter finds convenient. Legible copies of original field-notes
			or extended narratives which include detailed descriptions are preferred, but all types of documentation are welcome.
			<B>This form is intended only as a convenience.</B> It may be used flexibly and need not be used at all. Please
			leave blank any details not observed or unknown. To submit more than one report, please hit the reset button after
			submitting each report.<BR>
			<IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="12" VSPACE="10">Drawings and photographs
			should be mailed (or emailed) separately to the Secretary. Please include <B>all </B>photos if an obscurely marked species.
			Slides are generally preferable to prints. Thank you very much for participating in the committee process and helping
			to advance our understanding of California's birdlife.<BR>
			<IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" VSPACE="5"><BR>
			Secretary:<BR>
			<IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="30">Guy McCaskie<BR>
			<IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="30">P.O. Box 275<BR>
			<IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="30">Imperial Beach, CA  91933-0275<BR>
			<IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="30"><A HREF="mailto:&#103;&#117;&#121;&#109;&#99;&#99;&#64;&#112;&#97;&#99;&#98;&#101;&#108;&#108;&#46;&#110;&#101;&#116;">&#103;&#117;&#121;&#109;&#99;&#99;&#64;&#112;&#97;&#99;&#98;&#101;&#108;&#108;&#46;&#110;&#101;&#116;</A><BR>
			<IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" VSPACE="10">
		</TD>
	</TR>
</TABLE>

<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="580">
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD>
			<P><B>Common and scientific name (select one):</B><BR>
			
			<SELECT NAME="Species" SIZE="8">
			<OPTION>Black-bellied Whistling-Duck&nbsp;&nbsp;&nbsp;&nbsp;Dendrocygna autumnalis </OPTION>
			<OPTION>Emperor Goose&nbsp;&nbsp;&nbsp;&nbsp;Chen canagica </OPTION>
			<OPTION>Trumpeter Swan&nbsp;&nbsp;&nbsp;&nbsp;Cygnus buccinator </OPTION>
			<OPTION>Whooper Swan&nbsp;&nbsp;&nbsp;&nbsp;Cygnus cygnus </OPTION>
			<OPTION>Falcated Duck&nbsp;&nbsp;&nbsp;&nbsp;Anas falcata </OPTION>
			<OPTION>American Black Duck&nbsp;&nbsp;&nbsp;&nbsp;Anas rubripes </OPTION>
			<OPTION>Garganey&nbsp;&nbsp;&nbsp;&nbsp;Anas querquedula </OPTION>
			<OPTION>Baikal Teal&nbsp;&nbsp;&nbsp;&nbsp;Anas formosa </OPTION>
			<OPTION>Common Pochard&nbsp;&nbsp;&nbsp;&nbsp;Aythya ferina </OPTION>
			<OPTION>Steller's Eider&nbsp;&nbsp;&nbsp;&nbsp;Polysticta stelleri </OPTION>
			<OPTION>King Eider&nbsp;&nbsp;&nbsp;&nbsp;Somateria spectabilis </OPTION>
			<OPTION>Common Eider&nbsp;&nbsp;&nbsp;&nbsp;Somateria mollissima </OPTION>
			<OPTION>Smew&nbsp;&nbsp;&nbsp;&nbsp;Mergellus albellus </OPTION>
			<OPTION>Arctic Loon&nbsp;&nbsp;&nbsp;&nbsp;Gavia arctica </OPTION>
			<OPTION>Yellow-billed Loon&nbsp;&nbsp;&nbsp;&nbsp;Gavia adamsii </OPTION>
			<OPTION>Least Grebe&nbsp;&nbsp;&nbsp;&nbsp;Tachybaptus dominicus </OPTION>
			<OPTION>Shy Albatross&nbsp;&nbsp;&nbsp;&nbsp;Thalassarche cauta </OPTION>
			<OPTION>Light-mantled Albatross&nbsp;&nbsp;&nbsp;&nbsp;Phoebetria palpebrata </OPTION>
			<OPTION>Wandering Albatross&nbsp;&nbsp;&nbsp;&nbsp;Diomedea exulans </OPTION>
			<OPTION>Short-tailed Albatross&nbsp;&nbsp;&nbsp;&nbsp;Phoebastria albatrus </OPTION>
			<OPTION>Great-winged Petrel&nbsp;&nbsp;&nbsp;&nbsp;Pterodroma macroptera </OPTION>
			<OPTION>Mottled Petrel&nbsp;&nbsp;&nbsp;&nbsp;Pterodroma inexpectata </OPTION>
			<OPTION>Dark-rumped Petrel&nbsp;&nbsp;&nbsp;&nbsp;Pterodroma phaeopygia </OPTION>
			<OPTION>Stejneger's Petrel&nbsp;&nbsp;&nbsp;&nbsp;Pterodroma longirostris </OPTION>
			<OPTION>Bulwer's Petrel&nbsp;&nbsp;&nbsp;&nbsp;Bulweria bulwerii </OPTION>
			<OPTION>Parkinson's Petrel&nbsp;&nbsp;&nbsp;&nbsp;Procellaria parkinsoni </OPTION>
			<OPTION>Streaked Shearwater&nbsp;&nbsp;&nbsp;&nbsp;Calonectris leucomelas </OPTION>
			<OPTION>Cory's Shearwater&nbsp;&nbsp;&nbsp;&nbsp;Calonectris diomedea </OPTION>
			<OPTION>Greater Shearwater&nbsp;&nbsp;&nbsp;&nbsp;Puffinus gravis </OPTION>
			<OPTION>Wedge-tailed Shearwater&nbsp;&nbsp;&nbsp;&nbsp;Puffinus pacificus </OPTION>
			<OPTION>Townsend's Shearwater&nbsp;&nbsp;&nbsp;&nbsp;Puffinus auricularis </OPTION>
			<OPTION>Ringed Storm-Petrel&nbsp;&nbsp;&nbsp;&nbsp;Oceanodroma hornbyi </OPTION>
			<OPTION>Wedge-rumped Storm-Petrel&nbsp;&nbsp;&nbsp;&nbsp;Oceanodroma tethys </OPTION>
			<OPTION>Tristram's Storm-Petrel&nbsp;&nbsp;&nbsp;&nbsp;Oceanodroma tristrami</OPTION>
			<OPTION>White-tailed Tropicbird&nbsp;&nbsp;&nbsp;&nbsp;Phaethon lepturus </OPTION>
			<OPTION>Red-tailed Tropicbird&nbsp;&nbsp;&nbsp;&nbsp;Phaethon rubricauda </OPTION>
			<OPTION>Masked Booby&nbsp;&nbsp;&nbsp;&nbsp;Sula dactylatra </OPTION>
			<OPTION>Blue-footed Booby&nbsp;&nbsp;&nbsp;&nbsp;Sula nebouxii </OPTION>
			<OPTION>Red-footed Booby&nbsp;&nbsp;&nbsp;&nbsp;Sula sula </OPTION>
			<OPTION>Neotropic Cormorant&nbsp;&nbsp;&nbsp;&nbsp;Phalacrocorax brasilianus </OPTION>
			<OPTION>Anhinga&nbsp;&nbsp;&nbsp;&nbsp;Anhinga anhinga </OPTION>
			<OPTION>Great Frigatebird&nbsp;&nbsp;&nbsp;&nbsp;Fregata minor </OPTION>
			<OPTION>Lesser Frigatebird&nbsp;&nbsp;&nbsp;&nbsp;Fregata ariel </OPTION>
			<OPTION>Tricolored Heron&nbsp;&nbsp;&nbsp;&nbsp;Egretta tricolor </OPTION>
			<OPTION>Yellow-crowned Night-Heron&nbsp;&nbsp;&nbsp;&nbsp;Nyctanassa violacea </OPTION>
			<OPTION>White Ibis&nbsp;&nbsp;&nbsp;&nbsp;Eudocimus albus </OPTION>
			<OPTION>Glossy Ibis&nbsp;&nbsp;&nbsp;&nbsp;Plegadis falcinellus </OPTION>
			<OPTION>Roseate Spoonbill&nbsp;&nbsp;&nbsp;&nbsp;Ajaia ajaja </OPTION>
			<OPTION>Black Vulture&nbsp;&nbsp;&nbsp;&nbsp;Coragyps atratus </OPTION>
            <option>Swallow-tailed Kite&nbsp;&nbsp;&nbsp;&nbsp;Elanoides forficatus</option>
			<OPTION>Mississippi Kite&nbsp;&nbsp;&nbsp;&nbsp;Ictinia mississippiensis </OPTION>
			<OPTION>Common Black-Hawk&nbsp;&nbsp;&nbsp;&nbsp;Buteogallus anthracinus </OPTION>
			<OPTION>Harris's Hawk&nbsp;&nbsp;&nbsp;&nbsp;Parabuteo unicinctus </OPTION>
			<OPTION>Crested Caracara&nbsp;&nbsp;&nbsp;&nbsp;Caracara cheriway </OPTION>
            <option>Eurasian Kestrel&nbsp;&nbsp;&nbsp;&nbsp;Falco tinnunculus</option>
			<OPTION>Gyrfalcon&nbsp;&nbsp;&nbsp;&nbsp;Falco rusticolus </OPTION>
			<OPTION>Purple Gallinule&nbsp;&nbsp;&nbsp;&nbsp;Porphyrula martinica </OPTION>
			<OPTION>American Golden-Plover&nbsp;&nbsp;&nbsp;&nbsp;Pluvialis dominica </OPTION>
			<OPTION>Lesser Sand-Plover&nbsp;&nbsp;&nbsp;&nbsp;Charadrius mongolus </OPTION>
			<OPTION>Greater Sand-Plover&nbsp;&nbsp;&nbsp;&nbsp;Charadrius leschenaultii </OPTION>
			<OPTION>Wilson's Plover&nbsp;&nbsp;&nbsp;&nbsp;Charadrius wilsonia </OPTION>
			<OPTION>Piping Plover&nbsp;&nbsp;&nbsp;&nbsp;Charadrius melodus </OPTION>
			<OPTION>Eurasian Dotterel&nbsp;&nbsp;&nbsp;&nbsp;Charadrius morinellus </OPTION>
			<OPTION>American Oystercatcher&nbsp;&nbsp;&nbsp;&nbsp;Haematopus palliatus </OPTION>
			<OPTION>Terek Sandpiper&nbsp;&nbsp;&nbsp;&nbsp; Xenus cinereus </OPTION>
			<OPTION>Gray-tailed Tattler&nbsp;&nbsp;&nbsp;&nbsp;Heteroscelus brevipes </OPTION>
			<OPTION>Spotted Redshank&nbsp;&nbsp;&nbsp;&nbsp;Tringa erythropus </OPTION>
			<OPTION>Common Greenshank&nbsp;&nbsp;&nbsp;&nbsp;Tringa nebularia </OPTION>
			<OPTION>Wood Sandpiper&nbsp;&nbsp;&nbsp;&nbsp;Tringa glareola </OPTION>
			<OPTION>Upland Sandpiper&nbsp;&nbsp;&nbsp;&nbsp;Bartramia longicauda </OPTION>
			<OPTION>Little Curlew&nbsp;&nbsp;&nbsp;&nbsp;Numenius minutus </OPTION>
			<OPTION>Bristle-thighed Curlew&nbsp;&nbsp;&nbsp;&nbsp;Numenius tahitiensis </OPTION>
			<OPTION>Hudsonian Godwit&nbsp;&nbsp;&nbsp;&nbsp;Limosa haemastica </OPTION>
			<OPTION>Bar-tailed Godwit&nbsp;&nbsp;&nbsp;&nbsp;Limosa lapponica </OPTION>
			<OPTION>Red-necked Stint&nbsp;&nbsp;&nbsp;&nbsp;Calidris ruficollis </OPTION>
			<OPTION>Little Stint&nbsp;&nbsp;&nbsp;&nbsp;Calidris minuta </OPTION>
			<OPTION>Long-toed Stint&nbsp;&nbsp;&nbsp;&nbsp;Calidris subminuta </OPTION>
			<OPTION>White-rumped Sandpiper&nbsp;&nbsp;&nbsp;&nbsp;Calidris fuscicollis </OPTION>
			<OPTION>Curlew Sandpiper&nbsp;&nbsp;&nbsp;&nbsp;Calidris ferruginea </OPTION>
			<OPTION>Jack Snipe&nbsp;&nbsp;&nbsp;&nbsp;Lymnocryptes minimus </OPTION>
			<OPTION>American Woodcock&nbsp;&nbsp;&nbsp;&nbsp;Scolopax minor </OPTION>			
			<OPTION>Swallow-tailed Gull&nbsp;&nbsp;&nbsp;&nbsp;Creagrus furcatus </OPTION>			
			<OPTION>Red-legged Kittiwake&nbsp;&nbsp;&nbsp;&nbsp;Rissa brevirostris </OPTION>
			<OPTION>Ivory Gull&nbsp;&nbsp;&nbsp;&nbsp;Pagophila eburnea </OPTION>
			<OPTION>Black-headed Gull&nbsp;&nbsp;&nbsp;&nbsp;Chroicocephalus ridibundus </OPTION>
			<OPTION>Little Gull&nbsp;&nbsp;&nbsp;&nbsp;Hydrocoloeus minutus </OPTION>
			<OPTION>Ross's Gull&nbsp;&nbsp;&nbsp;&nbsp;Rhodostethia rosea</OPTION>
			<OPTION>Belcher's Gull&nbsp;&nbsp;&nbsp;&nbsp;Larus belcheri </OPTION>
			<OPTION>Black-tailed Gull&nbsp;&nbsp;&nbsp;&nbsp;Larus crassirostris </OPTION>
			<OPTION>Iceland Gull&nbsp;&nbsp;&nbsp;&nbsp;Larus glaucoides </OPTION>
			<OPTION>Lesser Black-backed Gull&nbsp;&nbsp;&nbsp;&nbsp;Larus fuscus </OPTION>
			<OPTION>Slaty-backed Gull&nbsp;&nbsp;&nbsp;&nbsp;Larus schistisagus </OPTION>			
			<OPTION>Sooty Tern&nbsp;&nbsp;&nbsp;&nbsp;Sterna fuscata </OPTION>
			<OPTION>Bridled Tern&nbsp;&nbsp;&nbsp;&nbsp;Onychoprion anaethetus </OPTION>
			<OPTION>White-winged Tern&nbsp;&nbsp;&nbsp;&nbsp;Chlidonias leucopterus </OPTION>
			<OPTION>Sandwich Tern&nbsp;&nbsp;&nbsp;&nbsp;Sterna sandvicensis </OPTION>
			<OPTION>Thick-billed Murre&nbsp;&nbsp;&nbsp;&nbsp;Uria lomvia </OPTION>
			<OPTION>Long-billed Murrelet&nbsp;&nbsp;&nbsp;&nbsp;Brachyramphus perdix </OPTION>
			<OPTION>Kittlitz's Murrelet&nbsp;&nbsp;&nbsp;&nbsp;Brachyramphus brevirostris </OPTION>
			<OPTION>Parakeet Auklet&nbsp;&nbsp;&nbsp;&nbsp;Aethia psittacula </OPTION>
			<OPTION>Least Auklet&nbsp;&nbsp;&nbsp;&nbsp;Aethia pusilla </OPTION>
			<OPTION>Crested Auklet&nbsp;&nbsp;&nbsp;&nbsp;Aethia cristatella </OPTION>
			<OPTION>Oriental Turtle-Dove&nbsp;&nbsp;&nbsp;&nbsp;Streptopelia orientalis</OPTION>
			<OPTION>Black-billed Cuckoo&nbsp;&nbsp;&nbsp;&nbsp;Coccyzus erythropthalmus </OPTION>
			<OPTION>Groove-billed Ani&nbsp;&nbsp;&nbsp;&nbsp;Crotophaga sulcirostris </OPTION>
			<OPTION>Snowy Owl&nbsp;&nbsp;&nbsp;&nbsp;Bubo scandiacus </OPTION>
			<OPTION>Chuck-will's-widow&nbsp;&nbsp;&nbsp;&nbsp;Caprimulgus carolinensis </OPTION>
			<OPTION>Buff-collared Nightjar&nbsp;&nbsp;&nbsp;&nbsp;Caprimulgus ridgwayi </OPTION>
			<OPTION>White-collared Swift&nbsp;&nbsp;&nbsp;&nbsp;Streptoprocne zonaris </OPTION>
			<OPTION>Green Violetear&nbsp;&nbsp;&nbsp;&nbsp;Colibri thalassinus </OPTION>
			<OPTION>Broad-billed Hummingbird&nbsp;&nbsp;&nbsp;&nbsp;Cynanthus latirostris </OPTION>
			<OPTION>Xantus's Hummingbird&nbsp;&nbsp;&nbsp;&nbsp;Hylocharis xantusii </OPTION>
			<OPTION>Violet-crowned Hummingbird&nbsp;&nbsp;&nbsp;&nbsp;Amazilia violiceps </OPTION>
			<OPTION>Blue-throated Hummingbird&nbsp;&nbsp;&nbsp;&nbsp;Lampornis clemenciae </OPTION>
			<OPTION>Magnificent Hummingbird&nbsp;&nbsp;&nbsp;&nbsp;Eugenes fulgens </OPTION>
			<OPTION>Ruby-throated Hummingbird&nbsp;&nbsp;&nbsp;&nbsp;Archilochus colubris </OPTION>
			<OPTION>Red-headed Woodpecker&nbsp;&nbsp;&nbsp;&nbsp;Melanerpes erythrocephalus </OPTION>
			<OPTION>Greater Pewee&nbsp;&nbsp;&nbsp;&nbsp;Contopus pertinax </OPTION>
			<OPTION>Eastern Wood-Pewee&nbsp;&nbsp;&nbsp;&nbsp;Contopus virens </OPTION>
			<OPTION>Yellow-bellied Flycatcher&nbsp;&nbsp;&nbsp;&nbsp;Empidonax flaviventris </OPTION>
			<OPTION>Alder Flycatcher&nbsp;&nbsp;&nbsp;&nbsp;Empidonax alnorum </OPTION>
			<OPTION>Dusky-capped Flycatcher&nbsp;&nbsp;&nbsp;&nbsp;Myiarchus tuberculifer </OPTION>
			<OPTION>Nutting's Flycatcher&nbsp;&nbsp;&nbsp;&nbsp;Myiarchus nuttingi </OPTION>
			<OPTION>Great Crested Flycatcher&nbsp;&nbsp;&nbsp;&nbsp;Myiarchus crinitus </OPTION>
			<OPTION>Sulphur-bellied Flycatcher&nbsp;&nbsp;&nbsp;&nbsp;Myiodynastes luteiventris </OPTION>
			<OPTION>Couch's Kingbird&nbsp;&nbsp;&nbsp;&nbsp;Tyrannus couchii </OPTION>
			<OPTION>Thick-billed Kingbird&nbsp;&nbsp;&nbsp;&nbsp;Tyrannus crassirostris </OPTION>
			<OPTION>Fork-tailed Flycatcher&nbsp;&nbsp;&nbsp;&nbsp;Tyrannus savana </OPTION>
			<OPTION>Brown Shrike&nbsp;&nbsp;&nbsp;&nbsp;Lanius cristatus </OPTION>
			<OPTION>White-eyed Vireo&nbsp;&nbsp;&nbsp;&nbsp;Vireo griseus </OPTION>
			<OPTION>Blue-headed Vireo&nbsp;&nbsp;&nbsp;&nbsp;Vireo solitarius </OPTION>
			<OPTION>Yellow-green Vireo&nbsp;&nbsp;&nbsp;&nbsp;Vireo flavoviridis </OPTION>
			<OPTION>Blue Jay&nbsp;&nbsp;&nbsp;&nbsp;Cyanocitta cristata </OPTION>
			<OPTION>Sky Lark&nbsp;&nbsp;&nbsp;&nbsp;Alauda arvensis </OPTION>
			<OPTION>Cave Swallow&nbsp;&nbsp;&nbsp;&nbsp;Petrochelidon fulva </OPTION>
			<OPTION>Sedge Wren&nbsp;&nbsp;&nbsp;&nbsp;Cistothorus platensis </OPTION>
			<OPTION>Lanceolated Warbler&nbsp;&nbsp;&nbsp;&nbsp;Locustella lanceolata </OPTION>
			<OPTION>Dusky Warbler&nbsp;&nbsp;&nbsp;&nbsp;Phylloscopus fuscatus </OPTION>
			<OPTION>Arctic Warbler&nbsp;&nbsp;&nbsp;&nbsp;Phylloscopus borealis </OPTION>
			<OPTION>Red-flanked Bluetail&nbsp;&nbsp;&nbsp;&nbsp;Tarsiger cyanurus </OPTION>
			<OPTION>Northern Wheatear&nbsp;&nbsp;&nbsp;&nbsp;Oenanthe oenanthe </OPTION>
			<OPTION>Stonechat&nbsp;&nbsp;&nbsp;&nbsp;Saxicola torquatus </OPTION>
			<OPTION>Veery&nbsp;&nbsp;&nbsp;&nbsp;Catharus fuscescens </OPTION>
			<OPTION>Gray-cheeked Thrush&nbsp;&nbsp;&nbsp;&nbsp;Catharus minimus </OPTION>
			<OPTION>Wood Thrush&nbsp;&nbsp;&nbsp;&nbsp;Hylocichla mustelina </OPTION>
			<OPTION>Eyebrowed Thrush&nbsp;&nbsp;&nbsp;&nbsp;Turdus obscurus </OPTION>
			<OPTION>Rufous-backed Robin&nbsp;&nbsp;&nbsp;&nbsp;Turdus rufopalliatus </OPTION>
			<OPTION>Curve-billed Thrasher&nbsp;&nbsp;&nbsp;&nbsp;Toxostoma curvirostre </OPTION>
			<OPTION>Eastern Yellow Wagtail&nbsp;&nbsp;&nbsp;&nbsp;Motacilla tschutschensis </OPTION>
			<OPTION>Gray Wagtail&nbsp;&nbsp;&nbsp;&nbsp;Motacilla cinerea </OPTION>
			<OPTION>White Wagtail&nbsp;&nbsp;&nbsp;&nbsp;Motacilla alba </OPTION>
			<OPTION>Olive-backed Pipit&nbsp;&nbsp;&nbsp;&nbsp;Anthus hodgsoni </OPTION>
			<OPTION>Sprague's Pipit&nbsp;&nbsp;&nbsp;&nbsp;Anthus spragueii </OPTION>
			<OPTION>Blue-winged Warbler&nbsp;&nbsp;&nbsp;&nbsp;Vermivora pinus </OPTION>
			<OPTION>Golden-winged Warbler&nbsp;&nbsp;&nbsp;&nbsp;Vermivora chrysoptera </OPTION>
			<OPTION>Golden-cheeked Warbler&nbsp;&nbsp;&nbsp;&nbsp;Dendroica chrysoparia </OPTION>
			<OPTION>Yellow-throated Warbler&nbsp;&nbsp;&nbsp;&nbsp;Dendroica dominica </OPTION>
			<OPTION>Grace's Warbler&nbsp;&nbsp;&nbsp;&nbsp;Dendroica graciae </OPTION>
			<OPTION>Pine Warbler&nbsp;&nbsp;&nbsp;&nbsp;Dendroica pinus </OPTION>
			<OPTION>Cerulean Warbler&nbsp;&nbsp;&nbsp;&nbsp;Dendroica cerulea </OPTION>
			<OPTION>Worm-eating Warbler&nbsp;&nbsp;&nbsp;&nbsp;Helmitheros vermivorus </OPTION>
			<OPTION>Louisiana Waterthrush&nbsp;&nbsp;&nbsp;&nbsp;Seiurus motacilla </OPTION>
			<OPTION>Connecticut Warbler&nbsp;&nbsp;&nbsp;&nbsp;Oporornis agilis </OPTION>
			<OPTION>Mourning Warbler&nbsp;&nbsp;&nbsp;&nbsp;Oporornis philadelphia </OPTION>
			<OPTION>Red-faced Warbler&nbsp;&nbsp;&nbsp;&nbsp;Cardellina rubrifrons </OPTION>
			<OPTION>Cassin's Sparrow&nbsp;&nbsp;&nbsp;&nbsp;Aimophila cassinii </OPTION>
			<OPTION>Field Sparrow&nbsp;&nbsp;&nbsp;&nbsp;Spizella pusilla </OPTION>
			<OPTION>Baird's Sparrow&nbsp;&nbsp;&nbsp;&nbsp;Ammodramus bairdii </OPTION>
			<OPTION>Le Conte's Sparrow&nbsp;&nbsp;&nbsp;&nbsp;Ammodramus leconteii </OPTION>
			<OPTION>Smith's Longspur&nbsp;&nbsp;&nbsp;&nbsp;Calcarius pictus </OPTION>
			<OPTION>Little Bunting&nbsp;&nbsp;&nbsp;&nbsp;Emberiza pusilla </OPTION>
			<OPTION>Rustic Bunting&nbsp;&nbsp;&nbsp;&nbsp;Emberiza rustica </OPTION>
			<OPTION>Snow Bunting&nbsp;&nbsp;&nbsp;&nbsp;Plectrophenax nivalis </OPTION>
			<OPTION>Pyrrhuloxia&nbsp;&nbsp;&nbsp;&nbsp;Cardinalis sinuatus </OPTION>
			<OPTION>Varied Bunting&nbsp;&nbsp;&nbsp;&nbsp;Passerina versicolor </OPTION>
			<OPTION>Rusty Blackbird&nbsp;&nbsp;&nbsp;&nbsp;Euphagus carolinus </OPTION>
			<OPTION>Common Grackle&nbsp;&nbsp;&nbsp;&nbsp;Quiscalus quiscula </OPTION>
			<OPTION>Streak-backed Oriole&nbsp;&nbsp;&nbsp;&nbsp;Icterus pustulatus </OPTION>
			<OPTION>Brambling&nbsp;&nbsp;&nbsp;&nbsp;Fringilla montifringilla </OPTION>
			<OPTION>Black Rosy-Finch&nbsp;&nbsp;&nbsp;&nbsp;Leucosticte atrata </OPTION>
            <option>Common Rosefinch&nbsp;&nbsp;&nbsp;&nbsp;Carpodacus erythrinus</option>
			<OPTION>White-winged Crossbill&nbsp;&nbsp;&nbsp;&nbsp;Loxia leucoptera </OPTION>
			<OPTION>Common Redpoll&nbsp;&nbsp;&nbsp;&nbsp;Carduelis flammea </OPTION>
			<OPTION>Subspecies </OPTION>
			<OPTION>&#147;Bewick's&#148; Tundra Swan -- Cygnus columbianus bewickii </OPTION>
			<OPTION>&#147;American&#148; Brant -- Branta bernicla hrota </OPTION>
			<OPTION>&#147;Eastern&#148; Red-shouldered Hawk  -- Buteo lineatus lineatus </OPTION>
			<OPTION>&#147;Eurasian&#148; Whimbrel -- Numenius phaeopus phaeopus/variegatus </OPTION>
			<OPTION>&#147;Vega&#148; Herring Gull -- Larus argentatus vegae </OPTION>
			<OPTION>&#147;Eastern&#148; Bell's Vireo -- Vireo bellii belli/medius </OPTION>
			<OPTION>&#147;Eastern&#148; Winter Wren -- Troglodytes troglodytes hiemalis/pullus </OPTION>
			<OPTION>&#147;Eastern&#148; Hermit Thrush -- Catharus guttatus faxoni </OPTION>
			<OPTION>&#147;Siberian&#148; American Pipit -- Anthus rubescens japonicus </OPTION>
			<OPTION>&#147;Yellow&#148; Palm Warbler -- Dendroica palmarum hypochrysea </OPTION>
			<OPTION>&#147;White-winged&#148; Dark-eyed Junco -- Junco hyemalis aikeni </OPTION>
			<OPTION>&#147;Eastern&#148; Purple Finch -- Carpodacus purpureus purpureus </OPTION>
			<OPTION>Other (please enter in the box below) </OPTION>
			</SELECT></P>
			
			<P><B>Other:</B><BR>
			<INPUT TYPE="TEXT" NAME="Other species" SIZE="63" MAXLENGTH="63"></P>
			
			<P><B>Number of individuals, sexes, ages, general plumage<BR>
			(e.g. 2 adult males in breeding plumage):</B><BR>
			<TEXTAREA NAME="Number, sex, age, general plumage" ROWS="4" COLS="50" WRAP="virtual"></TEXTAREA></P>
			
			<P><B>County (select one):</B><BR>
			
			<SELECT NAME="County" SIZE="4">
			<OPTION>ALA - Alameda </OPTION>
			<OPTION>ALP - Alpine </OPTION>
			<OPTION>AMA - Amador </OPTION>
			<OPTION>BUT - Butte </OPTION>
			<OPTION>CC - Contra Costa </OPTION>
			<OPTION>CLV - Calaveras </OPTION>
			<OPTION>COL - Colusa </OPTION>
			<OPTION>DN - Del Norte </OPTION>
			<OPTION>ED - El Dorado </OPTION>
			<OPTION>FRE - Fresno </OPTION>
			<OPTION>GLE - Glenn </OPTION>
			<OPTION>HUM - Humboldt </OPTION>
			<OPTION>IMP - Imperial </OPTION>
			<OPTION>INY - Inyo </OPTION>
			<OPTION>KER - Kern </OPTION>
			<OPTION>KIN - Kings </OPTION>
			<OPTION>LA - Los Angeles </OPTION>
			<OPTION>LAK - Lake </OPTION>
			<OPTION>LAS - Lassen </OPTION>
			<OPTION>MAD - Madera </OPTION>
			<OPTION>MEN - Mendocino </OPTION>
			<OPTION>MER - Merced </OPTION>
			<OPTION>MNO - Mono </OPTION>
			<OPTION>MOD - Modoc </OPTION>
			<OPTION>MRN - Marin </OPTION>
			<OPTION>MRP - Mariposa </OPTION>
			<OPTION>MTY - Monterey </OPTION>
			<OPTION>NAP - Napa </OPTION>
			<OPTION>NEV - Nevada </OPTION>
			<OPTION>ORA - Orange </OPTION>
			<OPTION>PLA - Placer </OPTION>
			<OPTION>PLU - Plumas </OPTION>
			<OPTION>RIV - Riverside </OPTION>
			<OPTION>SAC - Sacramento </OPTION>
			<OPTION>SBA - Santa Barbara </OPTION>
			<OPTION>SBE - San Bernardino </OPTION>
			<OPTION>SBT - San Benito </OPTION>
			<OPTION>SCL - Santa Clara </OPTION>
			<OPTION>SCZ - Santa Cruz </OPTION>
			<OPTION>SD - San Diego </OPTION>
			<OPTION>SF - San Francisco </OPTION>
			<OPTION>SHA - Shasta </OPTION>
			<OPTION>SIE - Sierra </OPTION>
			<OPTION>SIS - Siskiyou </OPTION>
			<OPTION>SJ - San Joaquin </OPTION>
			<OPTION>SLO - San Luis Obispo </OPTION>
			<OPTION>SM - San Mateo </OPTION>
			<OPTION>SOL - Solano </OPTION>
			<OPTION>SON - Sonoma </OPTION>
			<OPTION>STA - Stanislaus </OPTION>
			<OPTION>SUT - Sutter </OPTION>
			<OPTION>TEH - Tehama </OPTION>
			<OPTION>TRI - Trinity </OPTION>
			<OPTION>TUL - Tulare </OPTION>
			<OPTION>TUO - Tuolumne </OPTION>
			<OPTION>VEN - Ventura </OPTION>
			<OPTION>YOL - Yolo </OPTION>
			<OPTION>YUB - Yuba </OPTION>
			</SELECT></P>

			<P><B>Exact location:</B><BR>
			<TEXTAREA NAME="Locality" ROWS="5" COLS="50" WRAP="virtual"></TEXTAREA></P>
			
		</TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
	</TR>
</TABLE>

<br>

<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="580">
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD COLSPAN="4"><B>Date(s) seen (e.g. 09 &#150; 15 December 1997):</B></TD>
		<TD ALIGN="RIGHT">
					<INPUT TYPE="TEXT" NAME="Date(s) seen" SIZE="20" MAXLENGTH="50">
		</TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
	</TR>
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD COLSPAN="4"><B>Time of day seen (e.g. 10:30 AM &#150; 2:00 PM):</B></TD>
		<TD ALIGN="RIGHT">
					<INPUT TYPE="TEXT" NAME="Time seen" SIZE="20" MAXLENGTH="50">
		</TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
	</TR>
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10" VSPACE="15"></TD>
		<TD COLSPAN="5"><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" VSPACE="15"><B>Reporting observer:</B></TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10" VSPACE="15"></TD>
	</TR>
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10" VSPACE="20"></TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="30" VSPACE="20"></TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" VSPACE="15"><B>Name:</B></TD>
		<TD COLSPAN="3"><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" VSPACE="20"><INPUT TYPE="TEXT" NAME="Reporting observer"
			SIZE="50" MAXLENGTH="50"></TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10" VSPACE="20"></TD>
	</TR>
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="30"></TD>
		<TD><B>Address:</B></TD>
		<TD COLSPAN="3"><INPUT TYPE="TEXT" NAME="Address" SIZE="50" MAXLENGTH="50"></TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
	</TR>
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="30"></TD>
		<TD><B>City:</B></TD>
		<TD COLSPAN="3"><INPUT TYPE="TEXT" NAME="City" SIZE="50" MAXLENGTH="50"></TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
	</TR>
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="30"></TD>
		<TD><B>State:</B></TD>
		<TD><INPUT TYPE="TEXT" NAME="State" SIZE="20" MAXLENGTH="20"></TD>
		<TD><B>Zip:</B></TD>
		<TD ALIGN="RIGHT">
					<INPUT TYPE="TEXT" NAME="Zip" SIZE="20" MAXLENGTH="20">
		</TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
	</TR>
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="30"></TD>
		<TD><B>Phone:</B></TD>
		<TD><INPUT TYPE="TEXT" NAME="Phone" SIZE="20" MAXLENGTH="20"></TD>
		<TD><B>Fax:</B></TD>
		<TD ALIGN="RIGHT">
					<INPUT TYPE="TEXT" NAME="Fax" SIZE="20" MAXLENGTH="20">
		</TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
	</TR>
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="30"></TD>
		<TD><B>E-mail:</B></TD>
		<TD COLSPAN="3"><INPUT TYPE="TEXT" NAME="E-mail" SIZE="50" MAXLENGTH="50"></TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
	</TR>
</TABLE>

<br>

<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="580">
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD>
			<P><B>Other observers accompanying reporter who also identified the bird:</B><BR>
			<TEXTAREA NAME="Other observers" ROWS="3" COLS="50" WRAP="virtual"></TEXTAREA></P>
			
			<P><B>Who originally found and/or identified the bird, and the full date span if known:</B><BR>
			<TEXTAREA NAME="Original finder(s)" ROWS="3" COLS="50" WRAP="virtual"></TEXTAREA></P>
			
			<P><B>Light conditions (position of bird in relation to direction and amount of light):</B><BR>
			<INPUT TYPE="TEXT" NAME="Light conditions" SIZE="63" MAXLENGTH="100"></P>
			
			<P><B>Optical equipment (type, power, condition):</B><BR>
			<INPUT TYPE="TEXT" NAME="Optical equipment" SIZE="63" MAXLENGTH="100"></P>
			
			<P><B>Distance to bird(s):</B><BR>
			<INPUT TYPE="TEXT" NAME="Distance" SIZE="63" MAXLENGTH="65"></P>
			
			<P><B>Duration of observation:</B><BR>
			<INPUT TYPE="TEXT" NAME="Duration of observation" SIZE="63" MAXLENGTH="65"></P>
			
			<P><B>Habitat (general and specific):</B><BR>
			<TEXTAREA NAME="Habitat" ROWS="3" COLS="50" WRAP="virtual"></TEXTAREA></P>
			
			<P><B>Behavior (flying, feeding, resting, etc.; include and stress any habits used in identification):</B><BR>
			<TEXTAREA NAME="Behavior" ROWS="5" COLS="50" WRAP="virtual"></TEXTAREA></P>
			
			<P><B>Description: (Include only what was actually seen, not what &quot;should&quot; have been seen. Include if
			possible: total length; body bulk; shape; bill, eye, and leg characteristics; color and pattern of plumage, etc.
			Stress field marks):</B><BR>
			<TEXTAREA NAME="Description" ROWS="9" COLS="50" WRAP="virtual"></TEXTAREA></P>
			
			<P><B>Voice:</B><BR>
			<TEXTAREA NAME="Voice" ROWS="2" COLS="50" WRAP="virtual"></TEXTAREA></P>
			
			<P><B>Similar species (include how they are eliminated by your observations):</B><BR>
			<TEXTAREA NAME="Similar species" ROWS="5" COLS="50" WRAP="virtual"></TEXTAREA></P>
			
			<P><B>Photographs (Was it photographed? By whom? Have copies been sent to the secretary?):</B><BR>
			<TEXTAREA NAME="Photographs" ROWS="2" COLS="50" WRAP="virtual"></TEXTAREA></P>
			
			<P><B>Previous experience with this species:</B><BR>
			<TEXTAREA NAME="Previous experience" ROWS="2" COLS="50" WRAP="virtual"></TEXTAREA></P>
			
			<P><B>Aids: List books, illustrations, birders, etc. used in identification</B></P>
			
			<P><B>&nbsp;&nbsp;a) at time of observation:</B><BR>
			<TEXTAREA NAME="References consulted during observation" ROWS="3" COLS="50" WRAP="virtual"></TEXTAREA></P>
			
			<P><B>&nbsp;&nbsp;b) after observation:</B><BR>
			<TEXTAREA NAME="References consulted after observation" ROWS="3" COLS="50" WRAP="virtual"></TEXTAREA></P>
			
			<B>This description written from (select all that apply):</B>
			
			<BLOCKQUOTE>
				<INPUT TYPE="CHECKBOX" NAME="Notes during observation"> <B>notes made during observation</B><BR>
				<INPUT TYPE="CHECKBOX" NAME="Notes immediately after observation"> <B>notes made immediately after observation</B><BR>
				<INPUT TYPE="CHECKBOX" NAME="Notes from memory"> <B>notes made from memory</B>
			</BLOCKQUOTE>
			
			<P><B>Are you positive of your identification?</B>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="Are you positive?"
			VALUE="Yes">&nbsp;&nbsp;<B>Yes</B>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="Are you positive?"
			VALUE="No">&nbsp;&nbsp;<B>No</B></P>
			
			<P><B>If not, please explain:</B><BR>
			<TEXTAREA NAME="Why not positive" ROWS="3" COLS="50" WRAP="virtual"></TEXTAREA></P>
			
			<!--<p align="CENTER"><input type=submit name=submit value="Submit Report">&nbsp;&nbsp;&nbsp;<INPUT TYPE="RESET" VALUE="Reset Form"></p>-->
			<p align="CENTER"><input type="submit" name="Submit Report" value="submit"/>&nbsp;&nbsp;&nbsp;<INPUT TYPE="RESET" VALUE="Reset Form"></p>
		</TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
	</TR>
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD align="center">
		<br>
<HR>
			
<A HREF="index.html">[&nbsp;CBRC&nbsp;Home&nbsp;Page&nbsp;]</A> <A HREF="cbrc_pur.html">[&nbsp;Purposes&nbsp;of&nbsp;CBRC&nbsp;]</A>
			<A HREF="bylaws.html">[&nbsp;CBRC&nbsp;Bylaws&nbsp;]</A> <A HREF="list.html">[&nbsp;Official&nbsp;California&nbsp;Bird&nbsp;Lists&nbsp;]</A>
			<A HREF="photos/index.html">[&nbsp;Rare&nbsp;Bird&nbsp;Photos&nbsp;]</A> <A HREF="cbrc_mem.html">[&nbsp;CBRC&nbsp;Membership&nbsp;]</A><BR>
			<A HREF="../index.html">[&nbsp;WFO&nbsp;Home&nbsp;Page&nbsp;]</A>
		</TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
	</TR>
</TABLE>

</FORM>

</BODY>

</HTML>