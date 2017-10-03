#!/usr/bin/perl -w

open OUT, ">Results.csv";

@files = <*.mafft.nuc.align.fna.out>;

foreach $file (@files) 
{

if ($file =~ m/(\S+)\.mafft.nuc.align.fna.out/)
        {
	$dS_line = 0;
	$dS = 0;
	$dN_line = 0;
	$dN = 0;
	$w_line = 0;
	$w = 0;
        $gene = $1;
        open FH, $file;
        while (<FH>)
                {
                if ($_ =~ m/^dS tree:\n/) 
			{               
			$dS_line = $_;
			$dS = <FH>;
			chomp $dS_line;
			chomp $dS;
			}
                if ($_ =~ m/^dN tree:\n/)
                        {           
                        $dN_line = $_;
			$dN = <FH>;
	                chomp $dN_line;
			chomp $dN;
    			}
                if ($_ =~ m/^w ratios as labels for TreeView:\n/)
                        {         
                        $w_line = $_;
			$w = <FH>;                             
                        chomp $w_line;
			chomp $w;
                        }
        	}    
       	}
print OUT "$gene, $dS_line, $dS, $dN_line, $dN, $w_line, $w\n";
close FH;
}
