#!/usr/bin/env bash

#This script will take the fasta output from MarkerMiner and extract all Open-Reading 
#Frames (ORFs;-minsize can be edited to users needs, as well as other components of the 
#commands in this script), then they will be aligned by Muscle, and the resulting output 
#will be converted into a format readable by PAML programs. This pipeline was developed 
#in a system which requires program modules to be loaded to your personal workspace, and
#includes the required "module load" commands - these can be removed in environments in 
#which they are not required. 

###Load required modules
module load emboss
module load muscle

#####This loop will extract ORFs from the fasta files
for i in ./*.fna
        
      	do getorf -sequence $i -outseq "$i"_orf -minsize 750 -osformat2 fasta -find 3

        done

#####This loop will align the extracted ORFs via muscle
for i in ./*.fna

        do muscle -in "$i"_orf -out "$i"_aln.fasta

        done

#####This loop will output phylip formatted sequence files that can be read by PAML 
####programs
for i in ./*.fna
        
        do perl fasta2phylip.pl  "$i"_aln.fasta "$i".phy

        done

