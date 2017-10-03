# Quals
This is a repository for scripts that I am working on for a written qualification exam. These will be moved to another 
repository upon completion and final edits.

  This repository holds a series of scripts is intended to take the output of MarkerMiner (Chamala et al 2014) and format for 
and run dN/dS analyses in codeml (PAML; Yang 1997). My goal was to make a pipeline that was simple, transportable, and would 
work on large data sets. The pipeline runs in a Unix environment, requires perl, as well as several common biological tools, 
including: GetOrf (EMBOSS; Rice et al 2000), muscle (Edgar 2004), and the PAML package (Yang 1997). The pipeline is designed to
run from within the MarkerMiner output folders and take the aligned fasta outputs, extract open-reading frames, align the ORFs,
re-format for codeml, then run the analyses and clean-up any unneeded files.


Literature cited:
Chamala, S., García, N., Godden, G. T., Krishnakumar, V., Jordon-Thaden, I. E., De Smet, R., Barbazuk, W. B., Soltis, D. E., 
  and Soltis, P. S. 2015. MarkerMiner 1.0: A new application for phylogenetic marker development using angiosperm 
  transcriptomes. Applications in Plant Sciences 3(4):1400115.

Edgar, R.C. (2004) MUSCLE: multiple sequence alignment with high accuracy and high throughput.
  Nucleic Acids Res. 32(5):1792-1797. 
  
Rice,P. Longden,I. and Bleasby,A. (2000) EMBOSS: The European Molecular Biology Open Software Suite. Trends in Genetics. 
  16(6):276--277.

Yang, Z. 1997. PAML: a program package for phylogenetic analysis by maximum likelihood
  Computer Applications in BioSciences 13:555-556.
