#!/usr/bin/perl

#This script generates a list of alignment files in the working directory and then creates
#a codeml ctl file for each one. This script requires access to a template ctl file, for
#which users may need to edit the path to. This script is targeted toward 
#analyses using phylogenies (codeml_ctl_maker.pl is simply for pairwise comparisons), and 
#will aslo require a tree file (a newick format file with the topology).

use warnings;

system 'ls *.phy > AlignmentFiles';
open FH1, "<AlignmentFiles";
while (<FH1>)
{
	if (/((\S+)\.phy)/)
	{
		$file = $1;
		$gene = $2;
		$OutFile = "$gene.out";
		$treefile = "$gene.tre";
		
		open OUT1, ">$gene.ctl";
		open FH2, "<codeml.ctl";
		while (<FH2>)
		{
		generate_ctl()
		}
	}
}
exit;
					
################################Sub-function below########################################
sub generate_ctl() {
	$line = $_;
	chomp $line;
	if ($line =~ m/.+SEQUENCEFILE.+/ || $line =~ m/.TREEFILE.+/ ||  $line =~ m/.+MLCOUTFILE.+/)
	{
		if ($line =~ m/.+(SEQUENCEFILE).+/)
		{
			$SEQFILE = $1;
			$line =~ s/$SEQFILE/$file/;
			print OUT1 "$line\n";
		}
		if ($line =~ m/.+(TREEFILE).+/)
        {
            $TREEFILE = $1;
            $line =~ s/$TREEFILE/$treefile/;
            print OUT1 "$line\n";
        }
		if ($line =~ m/.+(MLCOUTFILE).+/)
		{
			$OUTFILE = $1;
			$line =~ s/$OUTFILE/$OutFile/;
			print OUT1 "$line\n";
		}
	}
	else {print OUT1 "$line\n"}
}
			
			
