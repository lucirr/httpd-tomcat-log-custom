#!/usr/bin/perl
use strict;
use warnings;
use File::Path qw( make_path );

my $hostname=`hostname`;
chomp($hostname);
my $path="/usr/local/apache2/logs/${hostname}";
make_path($path);

my $log="error.log";
my $filename="${path}/${log}";

$|=1; # Use unbuffered output

open (STDOUT, ">> $filename") or die $!;

while(<STDIN>) {
    print STDOUT $_;
}
