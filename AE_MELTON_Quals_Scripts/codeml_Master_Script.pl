#!/bin/usr/perl -w

#This script connects all of the required scripts into a automated process that will 
#prep the data, run the analyses, produce a csv file with results, and remove any 
#unnecessary files. Paths to scripts will need to be edited for the users system. 

#This command calls on the codeml_pipe script, which will prepare the data for analysis
system("Scripts/codeml_pipe.sh") == 0
    or die "Script failed";

#This command will call on the codeml_ctl_maker script to generate ctl files for all
#alignment files in the folder
system("Scripts/codeml_ctl_maker.pl") == 0
    or die "Script failed";

#This will call on the job submission script
system("Scripts/Submit_codeml.pl") == 0
    or die "Script failed";

#Due to the time involved in submission of jobs, this command is used to allow that section
#of the pipe to finish before moving on.
system("sleep 300");

#This will call on the Get_Results script and produce a csv file with relevant results
system("Scripts/CODEML_PIPE/Get_Results.pl") == 0
    or die "Script failed";

#The following commands are to clean up the directory after running the analyses and 
#getting results. They will move the output and sequence files to their own folders, and
#then remove all other intermediate files.
system("mkdir OutPutFiles");

system("cp *out OutPutFiles/.");

system("cp Results.csv OutPutFiles/.");

system("mkdir SequenceFiles");

system("cp *_all.fna.fna SequenceFiles/.");

system("rm *");

