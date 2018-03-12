CC=gcc

#This makefile will function similar to the codeml_Master_Script.pl file. It will allow you to run the pipeline
#from a single commanline entry. Just enter make from the command line with this file in the folder, and the
#pipeline will run. Entering make VAR (where VAR = an object within this script) will allow you to start the
#process at the command of your choice. Each item is named after the script/function from which it is 
#derived (e.g., CTL is produced via the codeml_ctl_maker.pl script).

all : CLEANUP *out *sh *ctl *fasta #This will run everything.

CLEANUP : *out
	mkdir OutPutFiles\

	cp *out OutPutFiles/.\

	cp Results.csv OutPutFiles/.\

	mkdir SequenceFiles\

	cp *_all.fna.fna SequenceFiles/.\

	rm *

*out : *sh /ufrc/soltis/aemelton/Scripts/CODEML_PIPE/Get_Results.pl
	perl /ufrc/soltis/aemelton/Scripts/CODEML_PIPE/Get_Results.pl

*sh : *ctl /ufrc/soltis/aemelton/Scripts/CODEML_PIPE/Submit_codeml.pl
	perl /ufrc/soltis/aemelton/Scripts/CODEML_PIPE/Submit_codeml.pl && sleep 300

*ctl : *fasta /ufrc/soltis/aemelton/Scripts/CODEML_PIPE/codeml_ctl_maker.pl
	perl /ufrc/soltis/aemelton/Scripts/CODEML_PIPE/codeml_ctl_maker.pl

*fasta : *fna /ufrc/soltis/aemelton/Scripts/CODEML_PIPE/codeml_pipe.sh
	bash /ufrc/soltis/aemelton/Scripts/CODEML_PIPE/codeml_pipe.sh
