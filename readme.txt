
You may start an example by directly running 'go_*.m' for various data.

go_man.m         figure 1 in cvpr paper
go_dummy.m       figure 3 in cvpr paper
go_LFW.m         figure 4 in cvpr paper (one of 20 persons)
go_gore.m        figure 5 in cvpr paper
go_digits_3.m    figure 6 in cvpr paper
go_windows.m     figure 7 in cvpr paper

Have fun!

The code contains:
By default, the data are stored in the 'data' folder, and the results are stored in 'results' folder.
Each image file is also accompanied by a .mat file containing the initial coordinates of feature points. 
The 'RASL_toolbox' folder contains some necessary functions for file organization and image processing.

rasl_main.m         the main iteration loop for RASL
rasl_inner_apg.m    the APG algorithm for the inner convex optimization
rasl_inner_ialm.m   the inexact algorithm for the inner convex optimization
You may switch between the two algorithm by using the 'APGorALM_flag' in 'rasl_main.m'.
Note that, the inexact ALM algorithm is experiencally much faster than the APG algorithm. 
However, the APG algorithm is gurantted to converge, while the inexact algorithm not.
By default, we use the inexact algorithm for the sake of time.
