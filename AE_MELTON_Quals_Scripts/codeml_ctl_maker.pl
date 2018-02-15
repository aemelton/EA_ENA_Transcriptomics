#!/usr/bin/perl

#This script is designed to read in a list of files formatted for codeml analyses and 
#generate ctl files. For each file listed in AlignmentFiles, a ctl file will be generated
#with the appropriate information. The script requires a template ctl file to be accessed
#and the user may need to edit the path to this file (line 21).

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
		
		open OUT1, ">$gene.ctl";
		open FH2, "</scratch/lfs/aemelton/Scripts/codeml.ctl";
		while (<FH2>)
		{
			$line = $_;
			chomp $line;
			if ($line =~ m/.+SEQUENCEFILE.+/ || $line =~ m/.+MLCOUTFILE.+/)
			{
				if ($line =~ m/.+(SEQUENCEFILE).+/)
				{
					seqfile()
				}
				if ($line =~ m/.+(MLCOUTFILE).+/)
				{
					outfile()
				}
			}
			else {print OUT1 "$line\n"}
		}
	}
}
exit;				

##################
#This sub-function captures the sequence file name and prints it out to the ctl file
sub seqfile {
	$SEQFILE = $1;
	$line =~ s/$SEQFILE/$file/;
	print OUT1 "$line\n";
}

#This sub-function captures the analysis output file name and prints it out to the ctl 
#file
sub outfile {
	$OUTFILE = $1;
	$line =~ s/$OUTFILE/$OutFile/;
	print OUT1 "$line\n";
}
