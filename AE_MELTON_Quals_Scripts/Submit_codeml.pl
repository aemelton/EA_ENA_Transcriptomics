#!/usr/bin/perl

#This script is designed to work with a PBS queue system. It will take the ctl files in the working 
#directory, generate a bash submission script, and submit it to the queue. The submission parameters
#provided will need to be edited for the users needs (these parameters were used for the submission
#of several hundred - thousands of analyses). The script generates a list of ctl files within
#the working directory, parses the file name and extracts the gene ID, then prints out a submission
#file with the gene ID in the file name (e.g., GENE_ID.out).

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

\#PBS -M USER@SITE.COM

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
