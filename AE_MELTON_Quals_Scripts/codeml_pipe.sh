#!/usr/bin/env bash

###Load required modules
module load emboss
module load muscle

#####This loop will extract ORFs from the fast files
for i in ./*.fna
        
      	do getorf -sequence $i -outseq "$i"_orf -minsize 700 -osformat2 fasta -find 3

        done

#####This loops will align the extracted ORFs
for i in ./*.fna

        do muscle -in "$i"_orf -out "$i"_aln.fasta

        done

#####This loop will output phylip formatted sequence files that can be read by PAML 
####programs
for i in ./*.fna
        
        do perl /home/aemelton/Scripts/fasta2phylip.pl  "$i"_aln.fasta "$i".phy

        done
