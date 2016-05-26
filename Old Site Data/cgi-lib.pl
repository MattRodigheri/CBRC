#!/usr/local/bin/perl -- -*- C -*-

# Perl Routines to Manipulate CGI input
# S.E.Brenner@bioc.cam.ac.uk
# $Header: /cys/people/seb1005/http/cgi-bin/RCS/cgi-lib.pl,v 1.6 1994/07/13 15:00:50 seb1005 Exp $
#
# Copyright 1994 Steven E. Brenner  
# Unpublished work.
# Permission granted to use and modify this library so long as the
# copyright above is maintained, modifications are documented, and
# credit is given for any use of the library.
#
# Thanks are due to many people for reporting bugs and suggestions
# especially Meng Weng Wong, Maki Watanabe, Bo Frese Rasmussen,
# Andrew Dalke, Mark-Jason Dominus. 

# see http://www.seas.upenn.edu/~mengwong/forms/   or
#     http://www.bio.cam.ac.uk/web/                for more information

# Minimalist http form and script (http://www.bio.cam.ac.uk/web/minimal.cgi):
# if (&MethGet) {
#   print &PrintHeader,
#       '<form method=POST><input type="submit">Data: <input name="myfield">';
# } else {
#   &ReadParse(*input);
#   print &PrintHeader, &PrintVariables(%input);
# }


# MethGet
# Return true if this cgi call was using the GET request, false otherwise
# Now that cgi scripts can be put in the normal file space, it is useful
# to combine both the form and the script in one place with GET used to
# retrieve the form, and POST used to get the result.

sub MethGet {
  return ($ENV{'REQUEST_METHOD'} eq "GET");
}

# ReadParse
# Reads in GET or POST data, converts it to unescaped text, and puts
# one key=value in each member of the list "@in"
# Also creates key/value pairs in %in, using '\0' to separate multiple
# selections

# If a variable-gl