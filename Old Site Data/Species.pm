#!/usr/local/bin/perl5

######################################
# Purpose: This file is the database class.           #
# Based on: Brent Michalski's Simple Database #
######################################
                                   
## This code creates a "structure" for the data to go into.  

## Tell Perl that we want to keep other code from violating this code's space.                                   
package Species;  # This is case-sensitive!

## Creates a class with the named variables in it.
## Order is very important here.  It is the order in which all structures
## in your programs will store the data.
sub new {
  my $class = shift;
  my $self = {};

  if (defined $_[0]) { $self->{record} = shift; }  # Don't modify!
  if (defined $_[0]) { $self->{status} = shift; }
  if (defined $_[0]) { $self->{species} = shift; }
  if (defined $_[0]) { $self->{count} = shift; }
  if (defined $_[0]) { $self->{first_date} = shift; }
  if (defined $_[0]) { $self->{last_date} = shift; }
  if (defined $_[0]) { $self->{location} = shift; }
  if (defined $_[0]) { $self->{co} = shift; }
  if (defined $_[0]) { $self->{co2} = shift; }
  if (defined $_[0]) { $self->{note} = shift; }

  bless $self, $class;
  return $self;
}

## Each of these subroutines creates the key value that we will use to
## access the data with.
sub record {  # Don't modify!
  my $self = shift;
  $self->{record};
}

sub status {
  my $self = shift;
  $self->{status};
}

sub species {
  my $self = shift;
  $self->{species};
}

sub count {
  my $self = shift;
  $self->{count};
}

sub first_date {
  my $self = shift;
  $self->{first_date};
}

sub last_date {
  my $self = shift;
  $self->{last_date};
}

sub location {
  my $self = shift;
  $self->{location};
}

sub co {
  my $self = shift;
  $self->{co};
}

sub co2 {
  my $self = shift;
  $self->{co2};
}

sub note {
  my $self = shift;
  $self->{note};
}

## Required, otherwise the program will fail.
1;






