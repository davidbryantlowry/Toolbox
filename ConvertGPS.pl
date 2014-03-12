#!/usr/bin/perl
use warnings;
use strict;

my @locality;

#This program converts GPS coordinates of different types
#to decimal degrees

my $file = $ARGV[0];
open(IN, $file) or die;

foreach my $line (<IN>) {
 	chomp $line;
 	my @locality = split ("\t",$line);
 	#print "$locality[5]\,";
	#print "$locality[6]\n";
	$locality[5] =~ s/^W /-/;
 	$locality[6] =~ s/^N //;
 	$locality[5] =~ s/^W/-/;
 	$locality[6] =~ s/^N//;
 	#print "$locality[5]\,";
	#print "$locality[6]\n";
	if ($locality[5] =~ /-(\d+)[\.\s](\d+)[\.\s].*(\d{3})/) {
 		$locality[5] = -$1-(($2+($3*.001))/60);
 		$locality[5] = sprintf("%.6f",$locality[5]);
 	}
 	if ($locality[5] =~ /-(\d+)[\.\s](\d+)[\.\s\'].*(\d{2}\.\d+)\"/) {
 		$locality[5] = -$1-($2/60)-($3/3600);
 		$locality[5] = sprintf("%.6f",$locality[5]);
 	}
 	if ($locality[5] =~ /-(\d+)[\.\s](\d+)[\.\s\'].*(\d{2})/) {
 		$locality[5] = -$1-($2/60)-($3/3600);
 		$locality[5] = sprintf("%.6f",$locality[5]);
 	}
 	if ($locality[6] =~ /(\d+)[\.\s](\d+)[\.\s].*(\d{3})/) {
 		$locality[6] = $1+(($2+($3*.001))/60);
 		$locality[6] = sprintf("%.6f",$locality[6]);
 	}
 	if ($locality[6] =~ /(\d+)[\.\s](\d+)[\.\s\'].*(\d{2}\.\d+)\"/) {
 		$locality[6] = $1+($2/60)+($3/3600);
 		$locality[6] = sprintf("%.6f",$locality[6]);
 	}
 	if ($locality[6] =~ /(\d+)[\.\s](\d+)[\.\s\'].*(\d{2})/) {
 		$locality[6] = $1+($2/60)+($3/3600);
 		$locality[6] = sprintf("%.6f",$locality[6]);
 	}
 		print "$locality[5]\,";
	    print "$locality[6]\n";
}
