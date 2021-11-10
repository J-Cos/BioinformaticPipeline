#settings
    # general settings
        path <-"../../BioinformaticPipeline_Env"
            # this should be the path to the working directory within which you have the following folders:
                # BioinformaticPipeline - get this from github and then create your own control file from this template - don't modify anything else
                # FASTQs - fill this file with your unmerged multiplexed raw FASTQ files
                # ReferenceLibraries - fill this file with your taxonomic reference library formatted either as i) ... or ii) ...
                # IntermediateOutputs - this will be populated by the pipeline as it runs, it will enable the pipeline to be run over multiple sessions as the output from each module is saved here.
                # Results - this is where final results will be saved
        dataname="18s_test"
            # this should be the name you associate with this set of fastqs,  the inout fastq folder should be labelled with this
            # and all output and result files will be labelled with this name.


    # DADA2 settings
        truncLen=c(240,240)
            #the length at which the sequences should be truncated (forward and reverse)
        trimLeft=c(20,18)
            # the # of bases to remove from the start of the sequences
        maxN=0
            # after truncation seqs with more than this number of Ns are discarded (DADA2 does not allow Ns)
        maxEE=c(2,2)
            #  After truncation, reads with higher than ‘maxEE’ "expected errors"  
            # will be discarded. Expected errors are calculated from the nominal definition 
            # of the quality score: EE = sum(10^(-Q/10))
        truncQ=2
            # Truncate reads at the first instance of a quality score less than or equal to ‘truncQ’. 
        DesiredSequenceLengthRange=NULL
            #sequence length range to keep enter as e.g. 360:270, if NULL all sequence lengths are kept. 
            # Sequences that are much longer or shorter than expected
            # may be the result of non-specific priming. This removal is analogous to “cutting a band” 
            # in-silico to get amplicons of the targeted length. 
        pool="pseudo"
            #TRUE, FALSE, or pseudo. pseudo pooling approximates the effect of denoising with pooled samples, but with
            # linearly increasing computational time (ca. doubled compared to no pooling)
        multithread=TRUE
            #on windows set multithread=FALSE

    # swarmv2 settings
        differences=1
            #number of base differences at which swarm clustering will be performed (1=default)                               
            

    # lulu settings
        MatchlistRate=90 #as a %
            # % matching bases to consider clustering OTUs if co-occurence seen. 

    # IDTAXA settings
        Type ="Load"  
            #whether to "Create" or "Load" a training set, or perform "No Assignment"
        RefLibrary= "SILVA_SSU_r138_2019.RData" 
            #ref library to load if loading
        SeqsToAssign ="ESVs"
            #whether to assign to "ESVs", "OTUs", or "cOTUs"
        threshold=60
            # %age confidence of assignment required to record assignment

# run pipeline
    source(file.path(path, "BioinformaticPipeline", "Pipeline", "DSLI_SQL_Pipeline.R"))
