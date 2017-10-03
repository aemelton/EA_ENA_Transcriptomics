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
		$treefile = "$gene.pruned.tre";
		
		open OUT1, ">$gene.ctl";
		open FH2, "</home/aemelton/Scripts/CODEML_PIPE/codeml_phylo.ctl";
		while (<FH2>)
		{
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
	}
}
exit;
					
