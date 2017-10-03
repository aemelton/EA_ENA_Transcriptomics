#!/usr/bin/perl -w

#This script will go through a folder containing the output files of codeml analyses with 
#pairwise comparisons (ending in .out in my files) and generate a CSV file with the 
#results. Users may need to change lines containing the ending patterns of results files 
#to match their own, if they differ. The script uses a function (see below) to read the 
#output files, identify the dS, dN, and w scores, then append them to the Results.csv 
#file.

open OUT, ">Results.csv";

@files = <*.mafft.nuc.align.fna.out>;
foreach $file (@files) 
{
if ($file =~ m/(\S+)\.mafft.nuc.align.fna.out/) {
	print_results() }
}

############################Sub-functions below##########################################
sub print_results {
#The next six lines generate empty variables to be filled as the script reads the outputs.
#This is done to prevent empty output files from being read and having the results from
#the previous file being repeated.
$dS_line = 0;
$dS = 0;
$dN_line = 0;
$dN = 0;
$w_line = 0;
$w = 0;
#Records the ID of the gene as listed in the file names
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
print OUT "$gene, $dS_line, $dS, $dN_line, $dN, $w_line, $w\n";
close FH;
}
