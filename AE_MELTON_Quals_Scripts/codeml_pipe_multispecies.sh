#!/usr/bin/env bash

###Load required modules
module load emboss
module load muscle
module load python
module load raxml
module load R

#####This loop will extract ORFs from the fast files
for i in ./*.fna
        
      	do getorf -sequence $i -outseq "$i"_orf -minsize 700 -osformat2 fasta -find 3

        done

#####This loops will align the extracted ORFs
for i in ./*.fna

        do muscle -in "$i"_orf -out "$i"_aln.fasta

        done

###This loop will truncate the name of the sequences to just the four character code
for i in *.fna
	
	do python /home/aemelton/Scripts/truncate_names.py -i "$i"_aln.fasta -o "$i"_trunc.fasta
	
	done

#####This loop will output phylip formatted sequence files that can be read by PAML 
####programs
for i in ./*.fna
        
        do perl /home/aemelton/Scripts/fasta2phylip.pl  "$i"_trunc.fasta "$i".phy

        done

###This loop will make trees!
for i in *.fna

	do raxmlHPC-SSE3 -m GTRGAMMA -p 12345 -s "$i"_trunc.fasta -n "$i"

	done

###Remove some waste
	rm RAxML_bi*
	rm RAxML_br*
	rm RAxML_bo*
	rm RAxML_in*
	rm RAxML_log*
	rm RAxML_info*
	rm RAxML_result*
	rm  RAxML_parsi*

###This loop will prune the full tree to make subtrees for the alignments with fewer taxa
for i in *.fna

	do Rscript /home/aemelton/Scripts/CODEML_PIPE/prune_tree.R RAxML_bestTree."$i" full_tree.tre "$i".pruned.tre

	done
