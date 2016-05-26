#!/usr/local/bin/perl5
push (@INC, '/cgi-bin');
require ('cgi-lib.pl');

# This should match the mail program on your system.
$mailprog = '/usr/lib/sendmail';

# This should be set to the username or alias that processes the
# requests


#------ Change 1 ----- Replace the login with your actual login name


$recipient = "login\@best.com";


# Print out a content-type for HTTP/1.0 compatibility
print "Content-type: text/html\n\n";

# Print a title and initial heading
print "<Head><Title>Order Form</Title></Head>";

&ReadParse;

#------ Change 2 ----- Replace the login with your actual login name

open (MAIL, "|$mailprog $recipient") || die "Unable to send request\nPlease send e-mail to login\@best.com, Thank you\n";
#open (MAIL, ">test") || die "Cannot open STDOUT: $!\n"; 
print MAIL "Reply-to: $in{'email'}\n";
print MAIL "Subject: Feedback Form\n";
print MAIL "\n\n";
#print "*$#in_key\n";
foreach $i (0 .. $#in_key){
#print "$in_key[$i] = $in_val[$i], i = $i <p>";
print MAIL "$in_key[$i] = $in_val[$i]\n"; 
}
print MAIL "-----------------------------------------------\n";
close (MAIL);

# ------Change 3-------- (Optional): You can replace some of the words below.
# You may want to not change it first and test it online. 

print "Your request has been sent.<P>";
print '<A HREF="index.html"><H3>Return to Home Page</H3></A>';




