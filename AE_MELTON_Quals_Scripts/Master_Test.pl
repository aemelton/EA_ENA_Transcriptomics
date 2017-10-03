#!/bin/usr/perl -w

system("/scratch/lfs/aemelton/Scripts/codeml_pipe.sh") == 0
    or die "Script failed";

system("/scratch/lfs/aemelton/Scripts/codeml_ctl_maker.pl") == 0
    or die "Script failed";

system("/scratch/lfs/aemelton/Scripts/CODEML_PIPE/codeml_ctl_maker_null.pl") == 0
    or die "Script failed";

system("/scratch/lfs/aemelton/Scripts/Submit_codeml.pl") == 0
    or die "Script failed";

system("sleep 300");

system("/scratch/lfs/aemelton/Scripts/CODEML_PIPE/Get_Results.pl") == 0
    or die "Script failed";

system("mkdir OutPutFiles");

system("cp *fna.out OutPutFiles/.");

system("cp Results.csv OutPutFiles/.");

system("/scratch/lfs/aemelton/Scripts/CODEML_PIPE/Get_Results_null.pl") == 0
    or die "Script failed";

system("mkdir OutPutFiles_2");

system("cp *null.out OutPutFiles_2/.");

system("cp Results_null.csv OutPutFiles_2/.");

system("mkdir SequenceFiles");

system("cp *_all.fna.fna SequenceFiles/.");

system("rm *");

