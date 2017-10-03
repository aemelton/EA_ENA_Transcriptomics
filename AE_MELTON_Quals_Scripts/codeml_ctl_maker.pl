#!/usr/bin/perl

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
					$SEQFILE = $1;
					$line =~ s/$SEQFILE/$file/;
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
	}
}
exit;
					
