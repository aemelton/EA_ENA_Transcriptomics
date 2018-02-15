CC=gcc

#This makefile will function similar to the codeml_Master_Script.pl file. It will allow you to run the pipeline
#from a single commanline entry. Just enter make from the command line with this file in the folder, and the
#pipeline will run. Entering make VAR (where VAR = an object within this script) will allow you to start the
#process at the command of your choice. Each item is named after the script/function from which it is 
#derived (e.g., CTL is produced via the codeml_ctl_maker.pl script).

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
