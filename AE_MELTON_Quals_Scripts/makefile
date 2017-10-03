CC=gcc

CLEANUP : RESULTS
        system("mkdir OutPutFiles")\

        system("cp *out OutPutFiles/.")\

        system("cp Results.csv OutPutFiles/.")\

        system("mkdir SequenceFiles")\

        system("cp *_all.fna.fna SequenceFiles/.")\

        system("rm *")

RESULTS : SLEEP
	perl Get_Results.pl

SLEEP: SUB
	system("sleep 300")

SUB : CTL
	perl Submit_codeml.pl

CTL : PIPE
	perl codeml_ctl_maker.pl

PIPE : ./*fna
	bash codeml_pipe.sh
