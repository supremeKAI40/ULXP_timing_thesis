#!/bin/bash

# Barrycenter correction on manually given folder list. Can be automated to detect obsID in file tree.
# Array of folders
folders=("6050390201" "6050390204" "6050390216" "6050390227" "6050390244" "6050390261" "6050390284")

# Loop through each folder and run the nicerl3-lc command followed by the barycorr command
for folder in "${folders[@]}";
do    
    # Run the barycorr command
    barycorr infile="./${folder}/xti/event_cl/ni${folder}_0mpu7_cl_day.evt" \
             outfile="./${folder}/xti/event_cl/ni${folder}_0mpu7_cl_day_barycorr.evt" \
             orbitfile="./${folder}/auxil/ni${folder}.orb.gz" barytime=yes clobber=yes refframe=ICRS ephem=JPLEPH.430
             2>&1 | tee "$folder/${folder}_barycorr_day.log"
done