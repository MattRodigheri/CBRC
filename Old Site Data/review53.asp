<!--#include file="ca_list_common.asp"--><%
Set rev = new BirdList : rev.Load Server.MapPath("main_list53.txt"), True
%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>

<HEAD>
	<META HTTP-EQUIV="Content-Type" CONTENT="text/html;CHARSET=iso-8859-1">
		<TITLE>California Bird Records Committee Review List</TITLE>
	<STYLE>
		.order { color: darkblue; font-weight: bold }
		.family { color: darkgreen; font-weight: bold; margin-left: 2.5em }
		.species { margin-left: 5em }
	</STYLE>
</HEAD>

<BODY>

<P>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="580">
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD><IMG SRC="wagtail4.gif" WIDTH="150" HEIGHT="80" ALIGN="BOTTOM" ALT="CBRC Logo by Tim Manolis" BORDER="0"><IMG SRC="dot_clea.gif"
			WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"><B><FONT SIZE="5" COLOR="#000066">Review List of the</FONT></B></TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
	</TR>
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD>
			<P ALIGN="CENTER"><B><FONT SIZE="5" COLOR="#000066">California Bird Records Committee</FONT></B></P>
			<P ALIGN="CENTER"><%=TextDate(rev.modified)%></P>
			<P><FONT SIZE="2">The sequence of birds on this list has been updated to follow the 7th edition of the <I>A.O.U Check-List of North
			American Birds</I>, and supplements.</P>

			<P>The California Bird Records Committee solicits information on all occurrences in California of the <%=TextNum(rev.total)%> species
			on this Review List, as well as species unrecorded in California. In general, review species average four or fewer
			occurrences per year in California, and have been recorded fewer than 100 times. Documentation should be sent to
			Guy McCaskie, California Bird Records Committee, P.O. Box 275, Imperial Beach, CA 91933-0275 (or by e-mail to <A
			HREF="mailto:secretary@californiabirds.org">secretary@californiabirds.org</A>).
			We also seek documentation concerning the potential establishment of introduced species not currently on the state list.  
			</FONT>
		</TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
	</TR>
</TABLE>
</P>

<P><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" VSPACE="5"> 
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="735">
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD WIDTH="663"><B>Legend</B><BR><BR>
			For species not supported by curated specimens (<%=rev.countNoSpec%> species):<BR><br>
			P - At least one record supported by identifiable photograph (<%=rev.countP%> species)<BR>
			V - At least one record supported by identifiable video (<%=rev.countV%> species)<BR>
			A - At least one record supported by identifiable audio recording (<%=rev.countA%> species)<BR>
			S - Supported only by sight records (<%=rev.countS%> species)<BR>
			<BR>
			<%=rev.list%><% set rev = Nothing %>
<DL>
	<DD>
	<DT><B><FONT COLOR="#000099">We also review records of the following species pairs and hybrids:</FONT></B></DT>
	<DL>
		<DD>Taiga/Tundra Bean-Goose <I>Anser fabalis/Anser serrirostris</I> - P<BR>
		Galapagos/Hawaiian Petrel <I>Pterodroma phaeopygia/Pterodroma sandwichensis</I> -PV<BR>
		Masked/Nazca Booby <I>Sula dactylatra/Sula granti</I> -P<BR>
		Blue-winged  X Golden-winged Warbler <I>Vermivora cyanoptera</I> X <I>V. chrysoptera</I>
	</DL>
</DL>
			</TD>
		<TD WIDTH="44"><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
	</TR>
</TABLE>
<IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" VSPACE="10"> 
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="580">
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD>
			<P ALIGN="CENTER"><A HREF="index.html">[&nbsp;CBRC&nbsp;Home&nbsp;Page&nbsp;]</A> <A HREF="cbrc_pur.html">[&nbsp;Purposes&nbsp;of&nbsp;CBRC&nbsp;]</A>
			<A HREF="bylaws.html">[&nbsp;CBRC&nbsp;Bylaws&nbsp;]</A> <A HREF="list.html">[&nbsp;Official&nbsp;California&nbsp;Bird&nbsp;Lists&nbsp;]</A>
			<A HREF="guidelines.html">[&nbsp;CBRC&nbsp;Report&nbsp;Form&nbsp;]</A> <A HREF="photos/index.html">[&nbsp;Rare&nbsp;Bird&nbsp;Photos&nbsp;]</A>
			<A HREF="cbrc_mem.html">[&nbsp;CBRC&nbsp;Membership&nbsp;]</A>
			<A HREF="../index.html">[</A><A HREF="http://www.westernfieldornithologists.org/">&nbsp;WFO&nbsp;Home&nbsp;Page</A><A
			HREF="../index.html">&nbsp;]</A>
		</TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
	</TR>
</TABLE>


</BODY>

</HTML>