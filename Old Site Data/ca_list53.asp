<!--#include file="ca_list_common.asp"--><%
Set main = new BirdList : main.Load Server.MapPath("main_list53.txt"), False
Set supp = new BirdList : supp.Load Server.MapPath("supp_list.txt"), False
%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>

<HEAD>
	<META HTTP-EQUIV="Content-Type" CONTENT="text/html;CHARSET=iso-8859-1">
	<META NAME="GENERATOR" Content="Visual Page 2.0 for Windows">
	<TITLE>Official California Bird Records Committee State Bird List</TITLE>
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
		<TD><IMG SRC="wagtail4.gif" WIDTH="150" HEIGHT="80" ALIGN="BOTTOM" ALT="CBRC Logo by Tim Manolis" BORDER="0"><B><FONT
			SIZE="5" COLOR="#000066">Official California Checklist</FONT></B></TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
	</TR>
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD>
			<P ALIGN="CENTER"><B><FONT SIZE="5" COLOR="#000066">by the California Bird Records Committee</FONT></B></P>
			<P ALIGN="CENTER">Updated <%=TextDate(Max(main.modified, supp.modified))%></P>
			<P><FONT SIZE="2">The sequence of birds on this list has been updated to follow the 7th edition of the <I>A.O.U Check-List of North
			American Birds</I>, and supplements.</P>
			<P>A total of <%=TextNum(main.total)%> species is included on this official California checklist, <%=TextNum(main.countI)%> of which are established introductions, and
			<%=TextNum(main.countE)%> of which have been extirpated within historical times. An additional <%=TextNum(supp.total)%> species have been recorded in the
			state, but are of uncertain natural occurrence and are included in a supplemental list following the
			main list. </P>
			
			<P>For new species to be added to the main list, at least one record of the species must be reviewed
			and accepted by the California Bird Records Committee (CBRC). All species on this list except those annotated with P, V, A or S are supported by at least one extant specimen 
			obtained in California. Species not supported by specimens are documented either by photographs (P), video recordings (V), audio recordings (A), or (S) sight records with one or more convincing
			written descriptions, but no other tangible evidence. Documentation supporting all records reviewed by the CBRC (except for the physical specimens) is permanently archived at the Western Foundation of Vertebrate Zoology, 439 Calle
			San Pablo, Camarillo, California 93012-8506, where it is available to researchers.</P>

			<P>The CBRC solicits documentation for all occurrences in California of species on its <A HREF="review.asp">Review List</A> (those annotated
			below with an asterisk), as well as species not yet recorded in California. In general, review species average four or
			fewer occurrences per year in California, and have been recorded fewer than 100 times. Documentation should be
			sent to Guy McCaskie, California Bird Records Committee, P.O. Box 275, Imperial Beach, CA 91933-0275 (or by e-mail
			to <A HREF="mailto:secretary@californiabirds.org">secretary@californiabirds.org</A>).
			We also seek documentation concerning the potential establishment of introduced species not currently on the state list.</FONT>
		</TD>
		<TD>&nbsp;</TD>
	</TR>
</TABLE>
</P>
<P>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="593">
	<TR>
		<TD WIDTH="35"><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD><B>Legend</B><BR>
			<BR>
			* - California Bird Records Committee Review Species (<%=main.countRev%> species)<BR>
			I - Introduced but now established in California (<%=main.countI%> species)<BR>
			E - Extirpated from California (<%=main.countE%> species)<BR>
			<BR>
			For species not supported by curated specimens (<%=main.countNoSpec%> species):<BR>
			<BR>
			P - At least one record supported by identifiable photograph (<%=main.countP%> species)<BR>
			V - At least one record supported by identifiable video (<%=main.countV%> species)<BR>
			A - At least one record supported by identifiable audio recording (<%=main.countA%> species)<BR>
			S - Supported only by sight records (<%=main.countS%> species)<BR>
			<BR>
			<B>Main List</B><BR>
			<%=main.list%><% set main = Nothing %>
			<BR>
			<B>Supplemental List</B><BR>
			<FONT SIZE="2">This list includes those species for which the CBRC has determined that all of the correctly identified records are
			of uncertain natural occurrence. Given available evidence, the CBRC could not reach a consensus as to
			whether records of these species involved true naturally occurring vagrants or escapes from captivity. However, a majority of CBRC
			members agreed that	these species should be admitted to this Supplemental List. Species judged by the CBRC to be probable escapees
			are not admitted to the Supplemental List.</FONT><BR>
			<%=supp.list%><% set supp = Nothing %>
		</TD>
		<TD>&nbsp;</TD>
	</TR>
</TABLE>
</P>

<P>
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0" WIDTH="580">
	<TR>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
		<TD>
			<P ALIGN="CENTER"><A HREF="index.html">[&nbsp;CBRC&nbsp;Home&nbsp;Page&nbsp;]</A> <A HREF="cbrc_pur.html">[&nbsp;Purposes&nbsp;of&nbsp;CBRC&nbsp;]</A>
			<A HREF="bylaws.html">[&nbsp;CBRC&nbsp;Bylaws&nbsp;]</A> <A HREF="list.html">[&nbsp;Official&nbsp;California&nbsp;Bird&nbsp;Lists&nbsp;]</A>
			<A HREF="guidelines.html">[&nbsp;CBRC&nbsp;Report&nbsp;Form&nbsp;]</A> <A HREF="photos/index.html">[&nbsp;Rare&nbsp;Bird&nbsp;Photos&nbsp;]</A>
			<A HREF="cbrc_mem.html">[&nbsp;CBRC&nbsp;Membership&nbsp;]</A>
			<A HREF="../index.html">[&nbsp;CBRC&nbsp;Home&nbsp;Page&nbsp;]</A>
		</TD>
		<TD><IMG SRC="dot_clea.gif" WIDTH="1" HEIGHT="1" ALIGN="BOTTOM" BORDER="0" HSPACE="10"></TD>
	</TR>
</TABLE>


</BODY>

</HTML>