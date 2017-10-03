#!/usr/bin/perl -w

open OUT, ">Results.csv";

@files = <*.mafft.nuc.align.fna.out>;
foreach $file (@files) 
{
if ($file =~ m/(\S+)\.mafft.nuc.align.fna.out/)
        {
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
