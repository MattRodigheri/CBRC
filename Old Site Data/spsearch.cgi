#!/usr/local/bin/perl5

require './cgi-lib.pl';
&ReadParse;

$search1=$in{'key1'};

if ($search1 eq "") {
  $search1="nomatch"
}

$search2=$in{'key2'};

#print "Content-type: text/html\n\n";
#print<<HTML5;
#    <HTML><BODY>$search1 $search2</BODY></HTML>
#HTML5

&search("./species.data","Species");

## Count the number of matches that were returned from the search.
$mcount=@array;

## Tell the browser what type of data is coming.
print "Content-type: text/html\n\n";

#print<<HTML2;
#     <HTML><BODY>$mcount</BODY></HTML>
#HTML2

## Print out some HTML, let the user know what is going on.
print<<HTML;
    <HTML><HEAD><TITLE>Prototype Database Search</TITLE></HEAD>
    <BODY BACKGROUND="ltgray.gif" BGCOLOR="#E6E6E6" LINK="#000099" VLINK="#666666">

    <TABLE WIDTH=580 CELLSPACING=0 CELLPADDING=8 BORDER=0>
    <TR><TD ROWSPAN=2><IMG SRC="wagtail4.gif" WIDTH=150 HEIGHT=80 BORDER=0 ALT="CBRC Logo by Tim Manolis"></TD>
    <TD VALIGN=BOTTOM><FONT SIZE=+1><B>CALIFORNIA BIRD RECORDS COMMITTEE</B></FONT></TD></TR>
    <TR><TD ALIGN=CENTER VALIGN=TOP><FONT SIZE=+1>Master List Query Results</FONT></TD></TR>
    <TR><TD><FONT SIZE=+1><B>$search1</B></FONT></TD><TD ALIGN=CENTER>$mcount records meet the search criteria</TD></TR>
    </TABLE>

    <TABLE BGCOLOR="#FFFFFF" CELLSPACING=1 CELLPADDING=7 BORDER=1>
    <TR>
    <TD ALIGN=CENTER><FONT SIZE=-1><B>Status</B></FONT></TD>
    <TD><FONT SIZE=-1><B>First Date</B></FONT></TD>
    <TD><FONT SIZE=-1><B>Last Date</B></FONT></TD>
    <TD ALIGN=CENTER><FONT SIZE=-1><B>Count</B></FONT></TD>
    <TD><FONT SIZE=-1>&nbsp;<B>Location</B></FONT></TD>
    <TD><FONT SIZE=-1><B>County</B></FONT></TD>
    <TD ALIGN=CENTER><FONT SIZE=-1><B>Record</B></FONT></TD>
    <TD><FONT SIZE=-1>&nbsp;<B>Notes</B></FONT></TD>
    </TR>
HTML

## Here we loop through $count times and display all of the data that
## matched our criteria.
for($x=0;$x<$mcount;$x++)
  {

    ## Puts the information into an array.
    $record=$array[$x]->record;
    $status=$array[$x]->status;
    $species=$array[$x]->species;
    $count=$array[$x]->count;
    $first_date=$array[$x]->first_date;
    $first_date=~s/0:00:00//;
    $last_date=$array[$x]->last_date;
    $last_date=~s/0:00:00//;
    $location=$array[$x]->location;
    $co=$array[$x]->co;
    $co2=$array[$x]->co2;
    $note=$array[$x]->note;

print<<HTML3;
    <TR>
    <TD ALIGN=CENTER><FONT SIZE=-1>&nbsp;$status</FONT></TD>
    <TD><FONT SIZE=-1>&nbsp;$first_date</FONT></TD>
    <TD><FONT SIZE=-1>&nbsp;$last_date</FONT></TD>
    <TD ALIGN=CENTER><FONT SIZE=-1>&nbsp;$count</FONT></TD>
    <TD><FONT SIZE=-1>&nbsp;$location</FONT></TD>
    <TD ALIGN=CENTER><FONT SIZE=-1>&nbsp;$co</FONT></TD>
    <TD ALIGN=CENTER><FONT SIZE=-1>&nbsp;$record</FONT></TD>
    <TD><FONT SIZE=-1>&nbsp;$note</FONT></TD>
    </TR>
HTML3

}

print<<HTML4;
    </TABLE>

    <TABLE WIDTH=580 CELLSPACING=0 CELLPADDING=0 BORDER=0>
    <TR><TD><IMG SRC="dot_clea.gif" WIDTH=1 HEIGHT=1 VSPACE=10></TD></TR>
    <TR><TD ALIGN=CENTER><A HREF="index.html">[&nbsp;CBRC&nbsp;Home&nbsp;Page&nbsp;]</A> <A
    HREF="cbrc_pur.shtml">[&nbsp;Purposes&nbsp;of&nbsp;CBRC&nbsp;]</A> <A
    HREF="list.shtml">[&nbsp;Official&nbsp;California&nbsp;Bird&nbsp;Lists&nbsp;]</A> <A
    HREF="publ.html">[&nbsp;CBRC&nbsp;Publications&nbsp;]</A> <A
    HREF="spsearch.html">[&nbsp;Master&nbsp;List&nbsp;Query&nbsp;]</A> <A
    HREF="cbrcform.html">[&nbsp;CBRC&nbsp;Report&nbsp;Form&nbsp;]</A>
    <A HREF="photos/index.html">[&nbsp;Rare&nbsp;Bird&nbsp;Photos&nbsp;]</A> <A
    HREF="cbrc_mem.shtml">[&nbsp;CBRC&nbsp;Membership&nbsp;]</A><BR>
    <A HREF="../index.shtml">[&nbsp;WFO&nbsp;Home&nbsp;Page&nbsp;]</A>
    </TD></TR>
    </TABLE>
    </BODY>
    </HTML>
HTML4

# This routine takes 2 arguments:
# 1)  The file name.
# 2)  The module name.
# You also need to set a variable called $search in your program.
#
# It returns an array called 'array' that is filled with the matching
# objects. If you have more than 1 match, you may want to call the
# appropriate function to handle that.

sub search{

require './lock.sub' || die "Require: $!\n";

$req=$_[1];

require ($req.".pm");
 $a=0;

open (SEARCH,$_[0]) || die;

 &lock(SEARCH);        # Lock the file so nobody else uses it.
 while(<SEARCH>)       # Loop through the file.
   {
      $_=~s/\"//g;     # Gets rid of quotes in the database.
      if (/$search1/i) {
         if (/$search2/) {
           my @test=split(/\|/,$_);
           $array[$a] = new $req(@test);
           $a++;
         }
      }

   } # End of While loop, so we must be at the end of the file.
 &unlock(SEARCH);
 close(SEARCH);

 return;

}















