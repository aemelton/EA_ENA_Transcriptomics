#!/usr/bin/perl

use warnings;
system 'ls *.ctl > CtlFiles';

open OUT1, ">submit.sh";
                print OUT1"#!/bin/sh
#SBATCH --job-name=$file   #Job name     
#SBATCH --mail-type=ALL   # Mail events (NONE, BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=aemelton@ufl.edu   # Where to send mail      
#SBATCH --cpus-per-task=4   # Number of cores: Can also use -c=4 
#SBATCH --qos=soltis-b
#SBATCH --mem-per-cpu=1gb   # Per processor memory
#SBATCH -t 24:00:00   # Walltime
#SBATCH -o $gene.out   # Name output file 
#
pwd; hostname; date
 
echo Running prime number generator program
 
echo There are $SLURM_CPUS_ON_NODE cores available.
 
module load gcc/5.2.0 
 
/ufrc/data/training/SLURM/prime/prime
 
date

module load paml\n";

open FH1, "<CtlFiles";
while (<FH1>)
{
        if (/((\S+)\.ctl)/)
        {
                $file = $1;
                $gene = $2;

		print OUT1"codeml $file\n";
        }
}
close FH1;
exit;
