# Quals
This is a repository for scripts that I am working on for a written qualification exam. These will be moved to another 
repository upon completion and final edits.

  This repository holds a series of scripts is intended to take the output of MarkerMiner (Chamala et al 2014) and format for 
and run dN/dS analyses in codeml (PAML; Yang 1997). My goal was to make a pipeline that was simple, transportable, and would 
work on large data sets. The pipeline runs in a Unix environment, requires perl, as well as several common biological tools, 
including: GetOrf (EMBOSS; Rice et al 2000), muscle (Edgar 2004), and the PAML package (Yang 1997). The pipeline is designed to
run from within the MarkerMiner output folders and take the aligned fasta outputs, extract open-reading frames, align the ORFs,
re-format for codeml, then run the analyses and clean-up any un-needed files.

How to run:
  First, you need your MarkerMiner output (or other folder of sequence files; scripts will require editing to fit the needs of 
the user if this is the case). Change your working directory to the fasta folder of the MarkerMiner output. From here, you can 
call on the master script. But, before running the script, there are several requirements to meet first: 1) make sure the paths
in the scripts are appropriate for your directory arrangement, 2) make sure that file extensions are standardized in your 
directories and in any edits you make to the scripts, 3) you must have the EMBOSS suite for GetOrf, muscle, and the PAML 
package to run the scripts to completion, and 4) determine whether the pairwise or phylogenetic components (SEE BELOW) are 
most appropriate for you and edit scripts as needed. Once all the requirements are met, all you have to do is run the master 
script (e.g., perl codeml_Master_script.pl) or run make (with the makefile in the working directory; SEE BELOW) and voila! The 
pipeline should be up-and-running. In the end, you will be left with a folder for output files, a folder for the sequence files, 
and all intermediate files should be removed.

"Master" script versus makefile:
  Both the master script and makefile will run all componenents of the pipeline automatically. When running the master script,
it will automatically begin at the start of the pipeline and run all components. With the makefile, you will be able to skip
components that have already been completed and are up-to-date and complete components of the pipeline that need to be completed.

Pairwise v Phylogenetic:
  Codeml can conduct dN/dS analyses in both a pairwise fashion (comparing just two sequences) or estimate over a phylogeny when
given a topology. This package of scripts contains scripts for both types of analyses. Some parts of the pipeline are universal
(codeml_pipe.sh, submit_codeml.pl, submit_with_slurm.pl), though some are specific to one or the other (codeml_ctl_maker.pl is
for pairwise comparisons, and codeml_ctl_maker_with_phylo.pl is for generating ctl files for analyses with phylogenies [though,
these scripts are very similar in form], and the "Get_Results" scripts). The Master script will be downloaded with code for
the pairwise comparisons, but it can be easily modified to run analyses with dN/dS estimation over phylogenies.   

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
