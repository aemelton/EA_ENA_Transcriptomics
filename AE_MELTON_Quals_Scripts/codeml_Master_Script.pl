#!/bin/usr/perl -w

system("/scratch/lfs/aemelton/Scripts/codeml_pipe.sh") == 0
    or die "Script failed";

system("/scratch/lfs/aemelton/Scripts/codeml_ctl_maker.pl") == 0
    or die "Script failed";

system("/scratch/lfs/aemelton/Scripts/Submit_codeml.pl") == 0
    or die "Script failed";

system("sleep 300");

system("/scratch/lfs/aemelton/Scripts/CODEML_PIPE/Get_Results.pl") == 0
    or die "Script failed";

system("mkdir OutPutFiles");

system("cp *out OutPutFiles/.");

system("cp Results.csv OutPutFiles/.");

system("mkdir SequenceFiles");

system("cp *_all.fna.fna SequenceFiles/.");

system("rm *");
