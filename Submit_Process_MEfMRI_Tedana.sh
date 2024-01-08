#!/bin/sh

####################################################################################
# Yuncong Ma, 6/26/2023
# This script is to submit job for tedana
# use qsub to run this job
# dir_main=/cbica/home/mayun/Projects/TMS
# qsub -terse -j y -pe threaded 1 -l h_vmem=50G -o $dir_main/Log/Process_MEfMRI_Tedana.o $dir_main/Script/Process_MEfMRI/Submit_Process_MEfMRI_Tedana.sh
####################################################################################

# Environment for Tedana
source activate /cbica/home/mayun/.conda/envs/ml
module unload ants/2.3.1
ANTSPATH=/cbica/home/mayun/Toolbox/ants/install/bin
export PATH=${ANTSPATH}:$PATH

# path
dir_main=/cbica/home/mayun/Projects/TMS
dir_fmriprep=$dir_main/Data/ME_fMRI
dir_bids=$dir_main/Raw_Data/MEfMRI

# log 
# manual reset
file_log=$dir_main/Log/Process_MEfMRI_Tedana.o


echo -e "Start to running Process_MEfMRI_Tedana" >> $file_log
echo -e "Start time : `date +%F-%H:%M:%S`\n" >> $file_log

# run Tedana
# python $dir_main/Script/Process_MEfMRI/Process_MEfMRI_Tedana.py --fmriprepDir $dir_fmriprep --bidsDir $dir_bids --cores '1'
python $dir_main/Script/Process_MEfMRI/Test_MEfMRI_Tedana.py 

# Map volume results to standard space
# map to surface format CIFTI
# python $dir_main/Script/Process_MEfMRI/Tedana_To_CIFTI.py


echo -e "\nFinished time : `date +%F-%H:%M:%S`\n" >> $file_log



