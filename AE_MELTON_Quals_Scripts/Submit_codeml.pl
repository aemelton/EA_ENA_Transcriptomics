#!/usr/bin/perl

use warnings;
system 'ls *.ctl > CtlFiles';

open FH1, "<CtlFiles";
while (<FH1>)
{
	if (/((\S+)\.ctl)/)
	{
		$file = $1;
		$gene = $2;
		open OUT1, ">$gene.sh";
		print OUT1"
\#\!/bin/bash

\#PBS -M aemelton\@ufl\.edu

\#PBS -m a

\#PBS - walltime=72:00:00

\#PBS -l pmem=1000mb

\#PBS -l nodes=1:ppn=1

cd \$PBS_O_WORKDIR

module load paml
codeml $file";
close OUT1;
system "qsub $gene.sh";
	}
}
close FH1;
exit;
