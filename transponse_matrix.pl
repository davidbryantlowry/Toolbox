#!/usr/bin/perl

#This perl script transposes any file in csv format
#The name of the file is the first argument

use warnings;
use strict;

my @matrix_rows;
my @matrix_array;
my $length1;
my $counter1;


my $file = $ARGV[0];
open(MATRIX, $file);

#Read lines of genotype file into an array
while (<MATRIX>){
	chomp;
	@matrix_rows = split('\,');
	$length1 = scalar @matrix_rows;
	push(@matrix_array, [@matrix_rows]);
	$counter1++;
	}

	

for (my $x=0; $x < $length1; ++$x){
	for (my $y=0; $y < $counter1-1; ++$y){
		print "$matrix_array[$y][$x]\,"
			}
		print "$matrix_array[$counter1-1][$x]\n";
	}


