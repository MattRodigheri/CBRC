#!/usr/local/bin/perl5
push (@INC, '/cgi-bin');
require ('cgi-lib.pl');

# This should match the mail program on your system.
$mailprog = '/usr/sbin/sendmail';

# This should be set to the username or alias that processes the
# request.
$recipient = "petelat1\@stanford.edu";

# Print out a content-type for HTTP/1.0 compatibility
print "Content-type: text/html\n\n";

# Print a title and initial heading
print "<HTML>\n\n";
print "<Head><Title>CBRC Report</Title></Head>\n\n";
print "<Body>\n\n";

&ReadParse;

foreach $i ( 0 .. $#in_key){
if ($in_val[$i] eq "on"){
$in_val[$i] = "yes";
}}

@Months = ('January','February','March','April','May','June',
'July','August','September','October','November','December');
($MDay,$Month,$Year) = (localtime)[3,4,5];
$TheMonth = $Months[$Month];
if ($Year gt 96){$PYear = '19'}
else {if ($Year lt 10){$PYear = '200'}
else {$PYear = '20'}}

foreach $i (0 .. $#in_key){
if ($in_val[$i] eq "Submit Report"){

open (MAIL, "|$mailprog $recipient") || die "Unable to send
request\nPlease send e-mail to $recipient, Thank you\n";
#open (MAIL, ">test") || die "Cannot open STDOUT: $!\n"; 
print MAIL "Reply-to: $in{'email'}\n";
print MAIL "To: $recipient\n";
print MAIL "From: CBRC Report Form Submission\n";
print MAIL "Subject: CBRC Report Form\n\n";
print MAIL "--------------------------------------------------\n";
print MAIL "Source: $ENV{'HTTP_REFERER'}\n";
#print "*$#in_key\n";
foreach $i (0 .. $#in_key){
unless ($in_val[$i] eq "") {
#print "$in_key[$i] = $in_val[$i], i = $i <p>";
print MAIL "$in_key[$i] = $in_val[$i]\n"; 
}}
print MAIL "Date submitted:  $MDay $TheMonth $PYear$Year\n";
print MAIL "--------------------------------------------------\n";
close (MAIL);

print "The following report form has been sent. Thank you!<P>\n\n";
print '<A HREF="index.html">Return to CBRC Home Page</A>';
print "<BR>\n";

}}

foreach $i (0 .. $#in_key){
if ($in_val[$i] eq "View Report"){
print qq(Your report is printed below. After reviewing it you
can press<BR>
your browser's "Back" button to return to the form page,<BR>
where you can make changes before submitting the report.<BR>\n);
}}

print "------------------------------------------------------<BR>\n";
foreach $i (0 .. $#in_key){
unless ($in_val[$i] eq "") {
print "$in_key[$i] = $in_val[$i]<BR>\n";
}}
print "Today's date:  $MDay $TheMonth
$PYear$Year<BR>\n";

print "------------------------------------------------------<P>\n\n";
#print '<A HREF="index.html"><H3>Return to CBRC Home
#Page</H3></A>';
#print "<BR>\n";
print "</BODY>\n";
print "</HTML>\n";







