#!/usr/bin/perl -w

#This script will go through a folder containing the output files of codeml (ending in 
#.out in my files) and generate a CSV file with the results. Users may need to change 
#lines containing the ending patterns of results files to match their own, if they differ.

open OUT, ">Results.csv";

@files = <*.mafft.nuc.align.fna.out>;
foreach $file (@files) 
{
if ($file =~ m/(\S+)\.mafft.nuc.align.fna.out/)
        {
        $Species = 0;
        $like = 0;
        $line = 0;
        $gene = $1;
        open FH, $file;
        while (<FH>)
                {
                if (/^\d/) 
 			{               
                        $Species = $_;
                	chomp $Species;
			}
                if (/^lnL =(\S+)/)
                        {
                        $like = $_;
			chomp $like;
                        }
                if (/^t= /)
                        {
                        $line = $_;
                        chomp $line;
                        print OUT "$gene,$Species,$line,$like\n";
                        }
                	}    
                }          
close FH;
}

