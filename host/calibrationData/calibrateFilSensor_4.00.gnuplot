
set grid
set yrange [0:8.000000]
plot "-" using 1:2 with linespoints title "TargetSpeed", \
     "-" using 1:3 with linespoints title "SensorSpeed", \
     "-" using 1:($2/$3) with linespoints title "ratio target/sensor", \
     3.995945 with lines title "Target Avg", \
     3.317397 with lines title "Sensor Avg", \
     "-" using 1:($3*1.204542) with linespoints title "Calibrated Speed (f: 1.205)"
0.184133 3.950000 3.340000
0.196510 4.040000 3.480000
0.208820 4.040000 3.480000
0.221115 4.040000 3.480000
0.233427 4.040000 3.530000
0.245958 4.040000 3.530000
0.258157 4.040000 3.530000
0.274321 4.040000 3.530000
0.286772 4.000000 3.420000
0.298961 4.000000 3.420000
0.311222 4.000000 3.420000
0.323518 4.000000 3.420000
0.335819 4.000000 3.310000
0.348088 4.000000 3.310000
0.364530 4.000000 3.310000
0.376870 3.930000 3.310000
0.389130 3.930000 3.180000
0.401444 3.930000 3.180000
0.413769 3.930000 3.180000
0.426024 3.930000 3.180000
0.438279 3.930000 3.160000
0.450566 3.930000 3.160000
0.462867 4.010000 3.160000
0.475246 4.010000 3.160000
0.487370 4.010000 3.280000
0.499735 4.010000 3.280000
0.512051 4.010000 3.280000
0.524288 4.010000 3.280000
0.536660 4.010000 3.380000
0.548867 4.010000 3.380000
0.565212 4.040000 3.380000
0.577632 4.040000 3.380000
0.589885 4.040000 3.420000
0.602114 4.040000 3.420000
0.614470 4.040000 3.420000
0.626767 4.040000 3.420000
0.639006 4.040000 3.280000
0.655279 4.040000 3.280000
0.667771 3.950000 3.280000
0.680006 3.950000 3.280000
0.696260 3.950000 3.240000
0.708719 3.950000 3.240000
0.720980 3.950000 3.240000
0.733206 3.950000 3.240000
0.745498 4.040000 3.170000
0.757824 4.040000 3.170000
0.770087 4.040000 3.170000
0.786330 4.040000 3.170000
0.798662 4.040000 3.220000
0.810949 4.040000 3.220000
0.823276 4.040000 3.220000
0.835564 4.040000 3.220000
0.847885 3.990000 3.360000
0.860118 3.990000 3.360000
0.876404 3.990000 3.360000
0.888920 3.990000 3.360000
0.901150 3.990000 3.450000
0.913440 3.990000 3.450000
0.925731 3.990000 3.450000
0.938026 3.990000 3.450000
0.950324 3.960000 3.470000
0.962601 3.960000 3.470000
0.974879 3.960000 3.470000
0.987161 3.960000 3.470000
0.999471 3.960000 3.280000
1.011736 3.960000 3.280000
1.023962 3.960000 3.280000
1.036229 4.040000 3.280000
1.048591 4.040000 3.280000
1.060875 4.040000 3.180000
1.077051 4.040000 3.180000
1.089529 4.040000 3.180000
1.101792 4.040000 3.180000
1.114061 4.040000 3.160000
1.126364 4.040000 3.160000
1.138644 3.990000 3.160000
1.150914 3.990000 3.160000
1.167164 3.990000 3.310000
1.182367 3.990000 3.310000
1.195981 3.990000 3.310000
1.208248 3.990000 3.490000
1.220558 3.990000 3.490000
1.232852 3.960000 3.490000
1.245125 3.960000 3.490000
1.257403 3.960000 3.460000
1.269719 3.960000 3.460000
1.282035 3.960000 3.460000
1.298224 3.960000 3.460000
1.310737 3.960000 3.460000
1.323123 4.010000 3.270000
1.335250 4.010000 3.270000
1.347637 4.010000 3.270000
1.359979 4.010000 3.270000
1.372184 4.010000 3.270000
1.388399 4.010000 3.090000
1.400953 4.010000 3.090000
1.413112 4.010000 3.090000
1.425475 4.010000 3.100000
1.437747 4.010000 3.100000
1.450050 4.010000 3.100000
1.462333 4.010000 3.100000
1.474624 4.010000 3.290000
1.486920 4.010000 3.290000
1.499208 4.010000 3.290000
1.511500 3.950000 3.290000
1.523773 3.950000 3.290000
1.536087 3.950000 3.530000
1.548371 3.950000 3.530000
1.560655 3.950000 3.530000
1.572927 3.950000 3.530000
1.589118 3.950000 3.570000
1.601565 4.040000 3.570000
1.613934 4.040000 3.570000
1.626150 4.040000 3.440000
1.638432 4.040000 3.440000
1.650762 4.040000 3.440000
1.663018 4.040000 3.440000
1.679225 4.040000 3.440000
1.691732 4.040000 3.360000
1.703990 3.960000 3.360000
1.720182 3.960000 3.360000
1.732705 3.960000 3.340000
1.745025 3.960000 3.340000
1.757208 3.960000 3.340000
1.769499 3.960000 3.340000
1.781798 3.960000 3.430000
1.794182 4.010000 3.430000
1.810351 4.010000 3.430000
1.822788 4.010000 3.430000
1.835081 4.010000 3.410000
1.847286 4.010000 3.410000
1.859629 4.010000 3.410000
1.871992 4.010000 3.410000
1.884216 4.010000 3.530000
1.900367 4.010000 3.530000
1.912850 4.010000 3.530000
1.925172 4.010000 3.530000
1.937450 4.010000 3.470000
1.949684 4.010000 3.470000
1.961976 4.010000 3.470000
1.974347 4.010000 3.470000
1.990510 4.010000 3.450000
2.002998 4.010000 3.450000
2.015356 4.010000 3.450000
2.031520 4.010000 3.300000
2.043987 4.010000 3.300000
2.056295 4.010000 3.300000
2.072514 3.960000 3.300000
2.084987 3.960000 3.310000
2.097200 3.960000 3.310000
2.109531 3.960000 3.310000
2.121797 3.960000 3.310000
2.134146 3.960000 3.410000
2.146382 3.960000 3.410000
2.158658 4.010000 3.410000
2.170970 4.010000 3.410000
2.183247 4.010000 3.590000
2.195559 4.010000 3.590000
2.207959 4.010000 3.590000
2.220084 4.010000 3.590000
2.232343 4.010000 3.730000
2.244721 3.960000 3.730000
2.256926 3.960000 3.730000
2.273181 3.960000 3.730000
2.285575 3.960000 3.650000
2.297848 3.960000 3.650000
2.310156 3.960000 3.650000
2.322440 3.960000 3.650000
2.334723 3.960000 3.650000
2.347059 3.990000 3.450000
2.363201 3.990000 3.450000
2.375789 3.990000 3.450000
2.388065 3.990000 3.450000
2.400326 3.990000 3.290000
2.412666 3.990000 3.290000
2.424933 3.990000 3.290000
2.437179 4.010000 3.290000
2.453417 4.010000 3.270000
2.465885 4.010000 3.270000
2.478134 4.010000 3.270000
2.490396 4.010000 3.400000
2.502753 4.010000 3.400000
2.515012 4.010000 3.400000
2.527300 4.010000 3.400000
2.543515 4.010000 3.400000
2.555987 4.010000 3.400000
2.568280 4.010000 3.400000
2.584557 4.010000 3.400000
2.596989 4.010000 3.380000
2.609196 4.010000 3.380000
2.621451 3.960000 3.380000
2.633827 3.960000 3.380000
2.646122 3.960000 3.300000
2.658384 3.960000 3.300000
2.670697 3.960000 3.300000
2.682986 3.960000 3.300000
2.695246 3.960000 3.320000
2.707534 4.010000 3.320000
2.719833 4.010000 3.320000
2.732116 4.010000 3.320000
2.744397 4.010000 3.260000
2.756781 4.010000 3.260000
2.768999 4.010000 3.260000
2.785171 4.010000 3.260000
2.797629 3.960000 3.200000
2.809931 3.960000 3.200000
2.822259 3.960000 3.200000
2.834527 3.960000 3.200000
2.846704 3.960000 3.220000
2.858979 3.960000 3.220000
2.875262 3.960000 3.220000
2.887696 4.060000 3.220000
2.900071 4.060000 3.240000
2.912356 4.060000 3.240000
2.924702 4.060000 3.240000
2.936945 4.060000 3.240000
2.949207 4.060000 3.310000
2.965417 4.060000 3.310000
2.977851 4.060000 3.310000
2.990174 3.950000 3.310000
3.002481 3.950000 3.330000
3.014783 3.950000 3.330000
3.027041 3.950000 3.330000
3.039324 3.950000 3.330000
3.055501 3.950000 3.310000
3.067990 3.950000 3.310000
3.080241 4.040000 3.310000
3.096560 4.040000 3.310000
3.109024 4.040000 3.280000
3.121251 4.040000 3.280000
3.133532 4.040000 3.280000
3.145807 4.040000 3.280000
3.158122 4.040000 3.140000
3.170399 4.040000 3.140000
3.182763 3.960000 3.140000
3.194983 3.960000 3.140000
3.207171 3.960000 3.180000
3.219594 3.960000 3.180000
3.231763 3.960000 3.180000
3.244186 3.960000 3.180000
3.256377 3.960000 3.220000
3.268711 4.040000 3.220000
3.280861 4.040000 3.220000
3.293165 4.040000 3.220000
3.305475 4.040000 3.340000
3.317803 4.040000 3.340000
3.330044 4.040000 3.340000
3.342362 4.040000 3.340000
3.354667 4.040000 3.350000
3.366933 3.990000 3.350000
3.379191 3.990000 3.350000
3.391515 3.990000 3.350000
3.403794 3.990000 3.270000
3.416052 3.990000 3.270000
3.428345 3.990000 3.270000
3.440650 3.990000 3.270000
3.456819 3.990000 3.270000
3.469613 3.950000 3.160000
3.481785 3.950000 3.160000
3.493991 3.950000 3.160000
3.506292 3.950000 3.160000
3.518609 3.950000 3.140000
3.530867 3.950000 3.140000
3.547056 3.950000 3.140000
3.559543 4.010000 3.140000
3.571812 4.010000 3.160000
3.588037 4.010000 3.160000
3.600494 4.010000 3.160000
3.612818 4.010000 3.160000
3.625080 4.010000 3.200000
3.637357 4.010000 3.200000
3.649657 3.960000 3.200000
3.661972 3.960000 3.200000
3.678263 3.960000 3.220000
3.690581 3.960000 3.220000
3.702920 3.960000 3.220000
3.715206 3.960000 3.240000
3.727490 3.960000 3.240000
3.739748 4.010000 3.240000
3.752073 4.010000 3.240000
3.764324 4.010000 3.240000
3.776631 4.010000 3.220000
3.788900 4.010000 3.220000
3.801217 4.010000 3.220000
3.813517 4.010000 3.220000
3.825756 4.010000 3.220000
3.838017 4.010000 3.220000
3.850377 4.010000 3.220000
3.862720 4.010000 3.220000
3.878943 4.010000 3.330000
3.891382 4.010000 3.330000
3.903614 4.010000 3.330000
3.915953 4.010000 3.450000
3.928158 4.010000 3.450000
3.940446 4.010000 3.450000
3.952704 4.010000 3.450000
3.968932 4.010000 3.450000
3.981407 4.010000 3.470000
3.993733 4.010000 3.470000
4.005968 4.010000 3.470000
4.018298 4.010000 3.360000
4.030593 4.010000 3.360000
4.042870 4.010000 3.360000
4.059086 4.010000 3.360000
4.071574 4.010000 3.260000
4.083873 4.010000 3.260000
4.100092 4.010000 3.260000
4.112516 3.960000 3.260000
4.124738 3.960000 3.220000
4.137100 3.960000 3.220000
4.149387 3.960000 3.220000
4.161673 3.960000 3.220000
4.173973 3.960000 3.220000
4.190197 3.960000 3.190000
4.202644 4.010000 3.190000
4.214885 4.010000 3.190000
4.227176 4.010000 3.270000
4.239525 4.010000 3.270000
4.251823 4.010000 3.270000
4.264049 4.010000 3.270000
4.276292 4.010000 3.270000
4.288542 3.960000 3.330000
4.300863 3.960000 3.330000
4.313113 3.960000 3.330000
4.325422 3.960000 3.330000
4.337719 3.960000 3.360000
4.350034 3.960000 3.360000
4.362402 3.960000 3.360000
4.374711 4.010000 3.360000
4.390872 4.010000 3.310000
4.403316 4.010000 3.310000
4.415650 4.010000 3.310000
4.431804 4.010000 3.290000
4.444216 4.010000 3.290000
4.456502 4.010000 3.290000
4.468774 4.010000 3.290000
4.481071 4.010000 3.270000
4.493360 4.010000 3.270000
4.505680 4.010000 3.270000
4.521816 4.010000 3.270000
4.534326 4.010000 3.260000
4.550469 4.010000 3.260000
4.563105 4.000000 3.260000
4.575392 4.000000 3.260000
4.591482 4.000000 3.300000
4.604078 4.000000 3.300000
4.616307 4.000000 3.300000
4.632547 4.000000 3.300000
4.645031 4.000000 3.320000
4.657311 3.960000 3.320000
4.673512 3.960000 3.320000
4.686010 3.960000 3.320000
4.702108 3.960000 3.220000
4.714690 3.960000 3.220000
4.726984 3.960000 3.220000
4.743145 4.010000 3.220000
4.755617 4.010000 3.100000
4.767798 4.010000 3.100000
4.784093 4.010000 3.100000
4.796601 4.010000 3.100000
4.812707 4.010000 3.080000
4.825202 4.010000 3.080000
4.837466 4.010000 3.080000
4.853609 4.010000 3.080000
4.866038 4.010000 3.080000
E
0.184133 3.950000 3.340000
0.196510 4.040000 3.480000
0.208820 4.040000 3.480000
0.221115 4.040000 3.480000
0.233427 4.040000 3.530000
0.245958 4.040000 3.530000
0.258157 4.040000 3.530000
0.274321 4.040000 3.530000
0.286772 4.000000 3.420000
0.298961 4.000000 3.420000
0.311222 4.000000 3.420000
0.323518 4.000000 3.420000
0.335819 4.000000 3.310000
0.348088 4.000000 3.310000
0.364530 4.000000 3.310000
0.376870 3.930000 3.310000
0.389130 3.930000 3.180000
0.401444 3.930000 3.180000
0.413769 3.930000 3.180000
0.426024 3.930000 3.180000
0.438279 3.930000 3.160000
0.450566 3.930000 3.160000
0.462867 4.010000 3.160000
0.475246 4.010000 3.160000
0.487370 4.010000 3.280000
0.499735 4.010000 3.280000
0.512051 4.010000 3.280000
0.524288 4.010000 3.280000
0.536660 4.010000 3.380000
0.548867 4.010000 3.380000
0.565212 4.040000 3.380000
0.577632 4.040000 3.380000
0.589885 4.040000 3.420000
0.602114 4.040000 3.420000
0.614470 4.040000 3.420000
0.626767 4.040000 3.420000
0.639006 4.040000 3.280000
0.655279 4.040000 3.280000
0.667771 3.950000 3.280000
0.680006 3.950000 3.280000
0.696260 3.950000 3.240000
0.708719 3.950000 3.240000
0.720980 3.950000 3.240000
0.733206 3.950000 3.240000
0.745498 4.040000 3.170000
0.757824 4.040000 3.170000
0.770087 4.040000 3.170000
0.786330 4.040000 3.170000
0.798662 4.040000 3.220000
0.810949 4.040000 3.220000
0.823276 4.040000 3.220000
0.835564 4.040000 3.220000
0.847885 3.990000 3.360000
0.860118 3.990000 3.360000
0.876404 3.990000 3.360000
0.888920 3.990000 3.360000
0.901150 3.990000 3.450000
0.913440 3.990000 3.450000
0.925731 3.990000 3.450000
0.938026 3.990000 3.450000
0.950324 3.960000 3.470000
0.962601 3.960000 3.470000
0.974879 3.960000 3.470000
0.987161 3.960000 3.470000
0.999471 3.960000 3.280000
1.011736 3.960000 3.280000
1.023962 3.960000 3.280000
1.036229 4.040000 3.280000
1.048591 4.040000 3.280000
1.060875 4.040000 3.180000
1.077051 4.040000 3.180000
1.089529 4.040000 3.180000
1.101792 4.040000 3.180000
1.114061 4.040000 3.160000
1.126364 4.040000 3.160000
1.138644 3.990000 3.160000
1.150914 3.990000 3.160000
1.167164 3.990000 3.310000
1.182367 3.990000 3.310000
1.195981 3.990000 3.310000
1.208248 3.990000 3.490000
1.220558 3.990000 3.490000
1.232852 3.960000 3.490000
1.245125 3.960000 3.490000
1.257403 3.960000 3.460000
1.269719 3.960000 3.460000
1.282035 3.960000 3.460000
1.298224 3.960000 3.460000
1.310737 3.960000 3.460000
1.323123 4.010000 3.270000
1.335250 4.010000 3.270000
1.347637 4.010000 3.270000
1.359979 4.010000 3.270000
1.372184 4.010000 3.270000
1.388399 4.010000 3.090000
1.400953 4.010000 3.090000
1.413112 4.010000 3.090000
1.425475 4.010000 3.100000
1.437747 4.010000 3.100000
1.450050 4.010000 3.100000
1.462333 4.010000 3.100000
1.474624 4.010000 3.290000
1.486920 4.010000 3.290000
1.499208 4.010000 3.290000
1.511500 3.950000 3.290000
1.523773 3.950000 3.290000
1.536087 3.950000 3.530000
1.548371 3.950000 3.530000
1.560655 3.950000 3.530000
1.572927 3.950000 3.530000
1.589118 3.950000 3.570000
1.601565 4.040000 3.570000
1.613934 4.040000 3.570000
1.626150 4.040000 3.440000
1.638432 4.040000 3.440000
1.650762 4.040000 3.440000
1.663018 4.040000 3.440000
1.679225 4.040000 3.440000
1.691732 4.040000 3.360000
1.703990 3.960000 3.360000
1.720182 3.960000 3.360000
1.732705 3.960000 3.340000
1.745025 3.960000 3.340000
1.757208 3.960000 3.340000
1.769499 3.960000 3.340000
1.781798 3.960000 3.430000
1.794182 4.010000 3.430000
1.810351 4.010000 3.430000
1.822788 4.010000 3.430000
1.835081 4.010000 3.410000
1.847286 4.010000 3.410000
1.859629 4.010000 3.410000
1.871992 4.010000 3.410000
1.884216 4.010000 3.530000
1.900367 4.010000 3.530000
1.912850 4.010000 3.530000
1.925172 4.010000 3.530000
1.937450 4.010000 3.470000
1.949684 4.010000 3.470000
1.961976 4.010000 3.470000
1.974347 4.010000 3.470000
1.990510 4.010000 3.450000
2.002998 4.010000 3.450000
2.015356 4.010000 3.450000
2.031520 4.010000 3.300000
2.043987 4.010000 3.300000
2.056295 4.010000 3.300000
2.072514 3.960000 3.300000
2.084987 3.960000 3.310000
2.097200 3.960000 3.310000
2.109531 3.960000 3.310000
2.121797 3.960000 3.310000
2.134146 3.960000 3.410000
2.146382 3.960000 3.410000
2.158658 4.010000 3.410000
2.170970 4.010000 3.410000
2.183247 4.010000 3.590000
2.195559 4.010000 3.590000
2.207959 4.010000 3.590000
2.220084 4.010000 3.590000
2.232343 4.010000 3.730000
2.244721 3.960000 3.730000
2.256926 3.960000 3.730000
2.273181 3.960000 3.730000
2.285575 3.960000 3.650000
2.297848 3.960000 3.650000
2.310156 3.960000 3.650000
2.322440 3.960000 3.650000
2.334723 3.960000 3.650000
2.347059 3.990000 3.450000
2.363201 3.990000 3.450000
2.375789 3.990000 3.450000
2.388065 3.990000 3.450000
2.400326 3.990000 3.290000
2.412666 3.990000 3.290000
2.424933 3.990000 3.290000
2.437179 4.010000 3.290000
2.453417 4.010000 3.270000
2.465885 4.010000 3.270000
2.478134 4.010000 3.270000
2.490396 4.010000 3.400000
2.502753 4.010000 3.400000
2.515012 4.010000 3.400000
2.527300 4.010000 3.400000
2.543515 4.010000 3.400000
2.555987 4.010000 3.400000
2.568280 4.010000 3.400000
2.584557 4.010000 3.400000
2.596989 4.010000 3.380000
2.609196 4.010000 3.380000
2.621451 3.960000 3.380000
2.633827 3.960000 3.380000
2.646122 3.960000 3.300000
2.658384 3.960000 3.300000
2.670697 3.960000 3.300000
2.682986 3.960000 3.300000
2.695246 3.960000 3.320000
2.707534 4.010000 3.320000
2.719833 4.010000 3.320000
2.732116 4.010000 3.320000
2.744397 4.010000 3.260000
2.756781 4.010000 3.260000
2.768999 4.010000 3.260000
2.785171 4.010000 3.260000
2.797629 3.960000 3.200000
2.809931 3.960000 3.200000
2.822259 3.960000 3.200000
2.834527 3.960000 3.200000
2.846704 3.960000 3.220000
2.858979 3.960000 3.220000
2.875262 3.960000 3.220000
2.887696 4.060000 3.220000
2.900071 4.060000 3.240000
2.912356 4.060000 3.240000
2.924702 4.060000 3.240000
2.936945 4.060000 3.240000
2.949207 4.060000 3.310000
2.965417 4.060000 3.310000
2.977851 4.060000 3.310000
2.990174 3.950000 3.310000
3.002481 3.950000 3.330000
3.014783 3.950000 3.330000
3.027041 3.950000 3.330000
3.039324 3.950000 3.330000
3.055501 3.950000 3.310000
3.067990 3.950000 3.310000
3.080241 4.040000 3.310000
3.096560 4.040000 3.310000
3.109024 4.040000 3.280000
3.121251 4.040000 3.280000
3.133532 4.040000 3.280000
3.145807 4.040000 3.280000
3.158122 4.040000 3.140000
3.170399 4.040000 3.140000
3.182763 3.960000 3.140000
3.194983 3.960000 3.140000
3.207171 3.960000 3.180000
3.219594 3.960000 3.180000
3.231763 3.960000 3.180000
3.244186 3.960000 3.180000
3.256377 3.960000 3.220000
3.268711 4.040000 3.220000
3.280861 4.040000 3.220000
3.293165 4.040000 3.220000
3.305475 4.040000 3.340000
3.317803 4.040000 3.340000
3.330044 4.040000 3.340000
3.342362 4.040000 3.340000
3.354667 4.040000 3.350000
3.366933 3.990000 3.350000
3.379191 3.990000 3.350000
3.391515 3.990000 3.350000
3.403794 3.990000 3.270000
3.416052 3.990000 3.270000
3.428345 3.990000 3.270000
3.440650 3.990000 3.270000
3.456819 3.990000 3.270000
3.469613 3.950000 3.160000
3.481785 3.950000 3.160000
3.493991 3.950000 3.160000
3.506292 3.950000 3.160000
3.518609 3.950000 3.140000
3.530867 3.950000 3.140000
3.547056 3.950000 3.140000
3.559543 4.010000 3.140000
3.571812 4.010000 3.160000
3.588037 4.010000 3.160000
3.600494 4.010000 3.160000
3.612818 4.010000 3.160000
3.625080 4.010000 3.200000
3.637357 4.010000 3.200000
3.649657 3.960000 3.200000
3.661972 3.960000 3.200000
3.678263 3.960000 3.220000
3.690581 3.960000 3.220000
3.702920 3.960000 3.220000
3.715206 3.960000 3.240000
3.727490 3.960000 3.240000
3.739748 4.010000 3.240000
3.752073 4.010000 3.240000
3.764324 4.010000 3.240000
3.776631 4.010000 3.220000
3.788900 4.010000 3.220000
3.801217 4.010000 3.220000
3.813517 4.010000 3.220000
3.825756 4.010000 3.220000
3.838017 4.010000 3.220000
3.850377 4.010000 3.220000
3.862720 4.010000 3.220000
3.878943 4.010000 3.330000
3.891382 4.010000 3.330000
3.903614 4.010000 3.330000
3.915953 4.010000 3.450000
3.928158 4.010000 3.450000
3.940446 4.010000 3.450000
3.952704 4.010000 3.450000
3.968932 4.010000 3.450000
3.981407 4.010000 3.470000
3.993733 4.010000 3.470000
4.005968 4.010000 3.470000
4.018298 4.010000 3.360000
4.030593 4.010000 3.360000
4.042870 4.010000 3.360000
4.059086 4.010000 3.360000
4.071574 4.010000 3.260000
4.083873 4.010000 3.260000
4.100092 4.010000 3.260000
4.112516 3.960000 3.260000
4.124738 3.960000 3.220000
4.137100 3.960000 3.220000
4.149387 3.960000 3.220000
4.161673 3.960000 3.220000
4.173973 3.960000 3.220000
4.190197 3.960000 3.190000
4.202644 4.010000 3.190000
4.214885 4.010000 3.190000
4.227176 4.010000 3.270000
4.239525 4.010000 3.270000
4.251823 4.010000 3.270000
4.264049 4.010000 3.270000
4.276292 4.010000 3.270000
4.288542 3.960000 3.330000
4.300863 3.960000 3.330000
4.313113 3.960000 3.330000
4.325422 3.960000 3.330000
4.337719 3.960000 3.360000
4.350034 3.960000 3.360000
4.362402 3.960000 3.360000
4.374711 4.010000 3.360000
4.390872 4.010000 3.310000
4.403316 4.010000 3.310000
4.415650 4.010000 3.310000
4.431804 4.010000 3.290000
4.444216 4.010000 3.290000
4.456502 4.010000 3.290000
4.468774 4.010000 3.290000
4.481071 4.010000 3.270000
4.493360 4.010000 3.270000
4.505680 4.010000 3.270000
4.521816 4.010000 3.270000
4.534326 4.010000 3.260000
4.550469 4.010000 3.260000
4.563105 4.000000 3.260000
4.575392 4.000000 3.260000
4.591482 4.000000 3.300000
4.604078 4.000000 3.300000
4.616307 4.000000 3.300000
4.632547 4.000000 3.300000
4.645031 4.000000 3.320000
4.657311 3.960000 3.320000
4.673512 3.960000 3.320000
4.686010 3.960000 3.320000
4.702108 3.960000 3.220000
4.714690 3.960000 3.220000
4.726984 3.960000 3.220000
4.743145 4.010000 3.220000
4.755617 4.010000 3.100000
4.767798 4.010000 3.100000
4.784093 4.010000 3.100000
4.796601 4.010000 3.100000
4.812707 4.010000 3.080000
4.825202 4.010000 3.080000
4.837466 4.010000 3.080000
4.853609 4.010000 3.080000
4.866038 4.010000 3.080000
E
0.184133 3.950000 3.340000
0.196510 4.040000 3.480000
0.208820 4.040000 3.480000
0.221115 4.040000 3.480000
0.233427 4.040000 3.530000
0.245958 4.040000 3.530000
0.258157 4.040000 3.530000
0.274321 4.040000 3.530000
0.286772 4.000000 3.420000
0.298961 4.000000 3.420000
0.311222 4.000000 3.420000
0.323518 4.000000 3.420000
0.335819 4.000000 3.310000
0.348088 4.000000 3.310000
0.364530 4.000000 3.310000
0.376870 3.930000 3.310000
0.389130 3.930000 3.180000
0.401444 3.930000 3.180000
0.413769 3.930000 3.180000
0.426024 3.930000 3.180000
0.438279 3.930000 3.160000
0.450566 3.930000 3.160000
0.462867 4.010000 3.160000
0.475246 4.010000 3.160000
0.487370 4.010000 3.280000
0.499735 4.010000 3.280000
0.512051 4.010000 3.280000
0.524288 4.010000 3.280000
0.536660 4.010000 3.380000
0.548867 4.010000 3.380000
0.565212 4.040000 3.380000
0.577632 4.040000 3.380000
0.589885 4.040000 3.420000
0.602114 4.040000 3.420000
0.614470 4.040000 3.420000
0.626767 4.040000 3.420000
0.639006 4.040000 3.280000
0.655279 4.040000 3.280000
0.667771 3.950000 3.280000
0.680006 3.950000 3.280000
0.696260 3.950000 3.240000
0.708719 3.950000 3.240000
0.720980 3.950000 3.240000
0.733206 3.950000 3.240000
0.745498 4.040000 3.170000
0.757824 4.040000 3.170000
0.770087 4.040000 3.170000
0.786330 4.040000 3.170000
0.798662 4.040000 3.220000
0.810949 4.040000 3.220000
0.823276 4.040000 3.220000
0.835564 4.040000 3.220000
0.847885 3.990000 3.360000
0.860118 3.990000 3.360000
0.876404 3.990000 3.360000
0.888920 3.990000 3.360000
0.901150 3.990000 3.450000
0.913440 3.990000 3.450000
0.925731 3.990000 3.450000
0.938026 3.990000 3.450000
0.950324 3.960000 3.470000
0.962601 3.960000 3.470000
0.974879 3.960000 3.470000
0.987161 3.960000 3.470000
0.999471 3.960000 3.280000
1.011736 3.960000 3.280000
1.023962 3.960000 3.280000
1.036229 4.040000 3.280000
1.048591 4.040000 3.280000
1.060875 4.040000 3.180000
1.077051 4.040000 3.180000
1.089529 4.040000 3.180000
1.101792 4.040000 3.180000
1.114061 4.040000 3.160000
1.126364 4.040000 3.160000
1.138644 3.990000 3.160000
1.150914 3.990000 3.160000
1.167164 3.990000 3.310000
1.182367 3.990000 3.310000
1.195981 3.990000 3.310000
1.208248 3.990000 3.490000
1.220558 3.990000 3.490000
1.232852 3.960000 3.490000
1.245125 3.960000 3.490000
1.257403 3.960000 3.460000
1.269719 3.960000 3.460000
1.282035 3.960000 3.460000
1.298224 3.960000 3.460000
1.310737 3.960000 3.460000
1.323123 4.010000 3.270000
1.335250 4.010000 3.270000
1.347637 4.010000 3.270000
1.359979 4.010000 3.270000
1.372184 4.010000 3.270000
1.388399 4.010000 3.090000
1.400953 4.010000 3.090000
1.413112 4.010000 3.090000
1.425475 4.010000 3.100000
1.437747 4.010000 3.100000
1.450050 4.010000 3.100000
1.462333 4.010000 3.100000
1.474624 4.010000 3.290000
1.486920 4.010000 3.290000
1.499208 4.010000 3.290000
1.511500 3.950000 3.290000
1.523773 3.950000 3.290000
1.536087 3.950000 3.530000
1.548371 3.950000 3.530000
1.560655 3.950000 3.530000
1.572927 3.950000 3.530000
1.589118 3.950000 3.570000
1.601565 4.040000 3.570000
1.613934 4.040000 3.570000
1.626150 4.040000 3.440000
1.638432 4.040000 3.440000
1.650762 4.040000 3.440000
1.663018 4.040000 3.440000
1.679225 4.040000 3.440000
1.691732 4.040000 3.360000
1.703990 3.960000 3.360000
1.720182 3.960000 3.360000
1.732705 3.960000 3.340000
1.745025 3.960000 3.340000
1.757208 3.960000 3.340000
1.769499 3.960000 3.340000
1.781798 3.960000 3.430000
1.794182 4.010000 3.430000
1.810351 4.010000 3.430000
1.822788 4.010000 3.430000
1.835081 4.010000 3.410000
1.847286 4.010000 3.410000
1.859629 4.010000 3.410000
1.871992 4.010000 3.410000
1.884216 4.010000 3.530000
1.900367 4.010000 3.530000
1.912850 4.010000 3.530000
1.925172 4.010000 3.530000
1.937450 4.010000 3.470000
1.949684 4.010000 3.470000
1.961976 4.010000 3.470000
1.974347 4.010000 3.470000
1.990510 4.010000 3.450000
2.002998 4.010000 3.450000
2.015356 4.010000 3.450000
2.031520 4.010000 3.300000
2.043987 4.010000 3.300000
2.056295 4.010000 3.300000
2.072514 3.960000 3.300000
2.084987 3.960000 3.310000
2.097200 3.960000 3.310000
2.109531 3.960000 3.310000
2.121797 3.960000 3.310000
2.134146 3.960000 3.410000
2.146382 3.960000 3.410000
2.158658 4.010000 3.410000
2.170970 4.010000 3.410000
2.183247 4.010000 3.590000
2.195559 4.010000 3.590000
2.207959 4.010000 3.590000
2.220084 4.010000 3.590000
2.232343 4.010000 3.730000
2.244721 3.960000 3.730000
2.256926 3.960000 3.730000
2.273181 3.960000 3.730000
2.285575 3.960000 3.650000
2.297848 3.960000 3.650000
2.310156 3.960000 3.650000
2.322440 3.960000 3.650000
2.334723 3.960000 3.650000
2.347059 3.990000 3.450000
2.363201 3.990000 3.450000
2.375789 3.990000 3.450000
2.388065 3.990000 3.450000
2.400326 3.990000 3.290000
2.412666 3.990000 3.290000
2.424933 3.990000 3.290000
2.437179 4.010000 3.290000
2.453417 4.010000 3.270000
2.465885 4.010000 3.270000
2.478134 4.010000 3.270000
2.490396 4.010000 3.400000
2.502753 4.010000 3.400000
2.515012 4.010000 3.400000
2.527300 4.010000 3.400000
2.543515 4.010000 3.400000
2.555987 4.010000 3.400000
2.568280 4.010000 3.400000
2.584557 4.010000 3.400000
2.596989 4.010000 3.380000
2.609196 4.010000 3.380000
2.621451 3.960000 3.380000
2.633827 3.960000 3.380000
2.646122 3.960000 3.300000
2.658384 3.960000 3.300000
2.670697 3.960000 3.300000
2.682986 3.960000 3.300000
2.695246 3.960000 3.320000
2.707534 4.010000 3.320000
2.719833 4.010000 3.320000
2.732116 4.010000 3.320000
2.744397 4.010000 3.260000
2.756781 4.010000 3.260000
2.768999 4.010000 3.260000
2.785171 4.010000 3.260000
2.797629 3.960000 3.200000
2.809931 3.960000 3.200000
2.822259 3.960000 3.200000
2.834527 3.960000 3.200000
2.846704 3.960000 3.220000
2.858979 3.960000 3.220000
2.875262 3.960000 3.220000
2.887696 4.060000 3.220000
2.900071 4.060000 3.240000
2.912356 4.060000 3.240000
2.924702 4.060000 3.240000
2.936945 4.060000 3.240000
2.949207 4.060000 3.310000
2.965417 4.060000 3.310000
2.977851 4.060000 3.310000
2.990174 3.950000 3.310000
3.002481 3.950000 3.330000
3.014783 3.950000 3.330000
3.027041 3.950000 3.330000
3.039324 3.950000 3.330000
3.055501 3.950000 3.310000
3.067990 3.950000 3.310000
3.080241 4.040000 3.310000
3.096560 4.040000 3.310000
3.109024 4.040000 3.280000
3.121251 4.040000 3.280000
3.133532 4.040000 3.280000
3.145807 4.040000 3.280000
3.158122 4.040000 3.140000
3.170399 4.040000 3.140000
3.182763 3.960000 3.140000
3.194983 3.960000 3.140000
3.207171 3.960000 3.180000
3.219594 3.960000 3.180000
3.231763 3.960000 3.180000
3.244186 3.960000 3.180000
3.256377 3.960000 3.220000
3.268711 4.040000 3.220000
3.280861 4.040000 3.220000
3.293165 4.040000 3.220000
3.305475 4.040000 3.340000
3.317803 4.040000 3.340000
3.330044 4.040000 3.340000
3.342362 4.040000 3.340000
3.354667 4.040000 3.350000
3.366933 3.990000 3.350000
3.379191 3.990000 3.350000
3.391515 3.990000 3.350000
3.403794 3.990000 3.270000
3.416052 3.990000 3.270000
3.428345 3.990000 3.270000
3.440650 3.990000 3.270000
3.456819 3.990000 3.270000
3.469613 3.950000 3.160000
3.481785 3.950000 3.160000
3.493991 3.950000 3.160000
3.506292 3.950000 3.160000
3.518609 3.950000 3.140000
3.530867 3.950000 3.140000
3.547056 3.950000 3.140000
3.559543 4.010000 3.140000
3.571812 4.010000 3.160000
3.588037 4.010000 3.160000
3.600494 4.010000 3.160000
3.612818 4.010000 3.160000
3.625080 4.010000 3.200000
3.637357 4.010000 3.200000
3.649657 3.960000 3.200000
3.661972 3.960000 3.200000
3.678263 3.960000 3.220000
3.690581 3.960000 3.220000
3.702920 3.960000 3.220000
3.715206 3.960000 3.240000
3.727490 3.960000 3.240000
3.739748 4.010000 3.240000
3.752073 4.010000 3.240000
3.764324 4.010000 3.240000
3.776631 4.010000 3.220000
3.788900 4.010000 3.220000
3.801217 4.010000 3.220000
3.813517 4.010000 3.220000
3.825756 4.010000 3.220000
3.838017 4.010000 3.220000
3.850377 4.010000 3.220000
3.862720 4.010000 3.220000
3.878943 4.010000 3.330000
3.891382 4.010000 3.330000
3.903614 4.010000 3.330000
3.915953 4.010000 3.450000
3.928158 4.010000 3.450000
3.940446 4.010000 3.450000
3.952704 4.010000 3.450000
3.968932 4.010000 3.450000
3.981407 4.010000 3.470000
3.993733 4.010000 3.470000
4.005968 4.010000 3.470000
4.018298 4.010000 3.360000
4.030593 4.010000 3.360000
4.042870 4.010000 3.360000
4.059086 4.010000 3.360000
4.071574 4.010000 3.260000
4.083873 4.010000 3.260000
4.100092 4.010000 3.260000
4.112516 3.960000 3.260000
4.124738 3.960000 3.220000
4.137100 3.960000 3.220000
4.149387 3.960000 3.220000
4.161673 3.960000 3.220000
4.173973 3.960000 3.220000
4.190197 3.960000 3.190000
4.202644 4.010000 3.190000
4.214885 4.010000 3.190000
4.227176 4.010000 3.270000
4.239525 4.010000 3.270000
4.251823 4.010000 3.270000
4.264049 4.010000 3.270000
4.276292 4.010000 3.270000
4.288542 3.960000 3.330000
4.300863 3.960000 3.330000
4.313113 3.960000 3.330000
4.325422 3.960000 3.330000
4.337719 3.960000 3.360000
4.350034 3.960000 3.360000
4.362402 3.960000 3.360000
4.374711 4.010000 3.360000
4.390872 4.010000 3.310000
4.403316 4.010000 3.310000
4.415650 4.010000 3.310000
4.431804 4.010000 3.290000
4.444216 4.010000 3.290000
4.456502 4.010000 3.290000
4.468774 4.010000 3.290000
4.481071 4.010000 3.270000
4.493360 4.010000 3.270000
4.505680 4.010000 3.270000
4.521816 4.010000 3.270000
4.534326 4.010000 3.260000
4.550469 4.010000 3.260000
4.563105 4.000000 3.260000
4.575392 4.000000 3.260000
4.591482 4.000000 3.300000
4.604078 4.000000 3.300000
4.616307 4.000000 3.300000
4.632547 4.000000 3.300000
4.645031 4.000000 3.320000
4.657311 3.960000 3.320000
4.673512 3.960000 3.320000
4.686010 3.960000 3.320000
4.702108 3.960000 3.220000
4.714690 3.960000 3.220000
4.726984 3.960000 3.220000
4.743145 4.010000 3.220000
4.755617 4.010000 3.100000
4.767798 4.010000 3.100000
4.784093 4.010000 3.100000
4.796601 4.010000 3.100000
4.812707 4.010000 3.080000
4.825202 4.010000 3.080000
4.837466 4.010000 3.080000
4.853609 4.010000 3.080000
4.866038 4.010000 3.080000
E
0.184133 3.950000 3.340000
0.196510 4.040000 3.480000
0.208820 4.040000 3.480000
0.221115 4.040000 3.480000
0.233427 4.040000 3.530000
0.245958 4.040000 3.530000
0.258157 4.040000 3.530000
0.274321 4.040000 3.530000
0.286772 4.000000 3.420000
0.298961 4.000000 3.420000
0.311222 4.000000 3.420000
0.323518 4.000000 3.420000
0.335819 4.000000 3.310000
0.348088 4.000000 3.310000
0.364530 4.000000 3.310000
0.376870 3.930000 3.310000
0.389130 3.930000 3.180000
0.401444 3.930000 3.180000
0.413769 3.930000 3.180000
0.426024 3.930000 3.180000
0.438279 3.930000 3.160000
0.450566 3.930000 3.160000
0.462867 4.010000 3.160000
0.475246 4.010000 3.160000
0.487370 4.010000 3.280000
0.499735 4.010000 3.280000
0.512051 4.010000 3.280000
0.524288 4.010000 3.280000
0.536660 4.010000 3.380000
0.548867 4.010000 3.380000
0.565212 4.040000 3.380000
0.577632 4.040000 3.380000
0.589885 4.040000 3.420000
0.602114 4.040000 3.420000
0.614470 4.040000 3.420000
0.626767 4.040000 3.420000
0.639006 4.040000 3.280000
0.655279 4.040000 3.280000
0.667771 3.950000 3.280000
0.680006 3.950000 3.280000
0.696260 3.950000 3.240000
0.708719 3.950000 3.240000
0.720980 3.950000 3.240000
0.733206 3.950000 3.240000
0.745498 4.040000 3.170000
0.757824 4.040000 3.170000
0.770087 4.040000 3.170000
0.786330 4.040000 3.170000
0.798662 4.040000 3.220000
0.810949 4.040000 3.220000
0.823276 4.040000 3.220000
0.835564 4.040000 3.220000
0.847885 3.990000 3.360000
0.860118 3.990000 3.360000
0.876404 3.990000 3.360000
0.888920 3.990000 3.360000
0.901150 3.990000 3.450000
0.913440 3.990000 3.450000
0.925731 3.990000 3.450000
0.938026 3.990000 3.450000
0.950324 3.960000 3.470000
0.962601 3.960000 3.470000
0.974879 3.960000 3.470000
0.987161 3.960000 3.470000
0.999471 3.960000 3.280000
1.011736 3.960000 3.280000
1.023962 3.960000 3.280000
1.036229 4.040000 3.280000
1.048591 4.040000 3.280000
1.060875 4.040000 3.180000
1.077051 4.040000 3.180000
1.089529 4.040000 3.180000
1.101792 4.040000 3.180000
1.114061 4.040000 3.160000
1.126364 4.040000 3.160000
1.138644 3.990000 3.160000
1.150914 3.990000 3.160000
1.167164 3.990000 3.310000
1.182367 3.990000 3.310000
1.195981 3.990000 3.310000
1.208248 3.990000 3.490000
1.220558 3.990000 3.490000
1.232852 3.960000 3.490000
1.245125 3.960000 3.490000
1.257403 3.960000 3.460000
1.269719 3.960000 3.460000
1.282035 3.960000 3.460000
1.298224 3.960000 3.460000
1.310737 3.960000 3.460000
1.323123 4.010000 3.270000
1.335250 4.010000 3.270000
1.347637 4.010000 3.270000
1.359979 4.010000 3.270000
1.372184 4.010000 3.270000
1.388399 4.010000 3.090000
1.400953 4.010000 3.090000
1.413112 4.010000 3.090000
1.425475 4.010000 3.100000
1.437747 4.010000 3.100000
1.450050 4.010000 3.100000
1.462333 4.010000 3.100000
1.474624 4.010000 3.290000
1.486920 4.010000 3.290000
1.499208 4.010000 3.290000
1.511500 3.950000 3.290000
1.523773 3.950000 3.290000
1.536087 3.950000 3.530000
1.548371 3.950000 3.530000
1.560655 3.950000 3.530000
1.572927 3.950000 3.530000
1.589118 3.950000 3.570000
1.601565 4.040000 3.570000
1.613934 4.040000 3.570000
1.626150 4.040000 3.440000
1.638432 4.040000 3.440000
1.650762 4.040000 3.440000
1.663018 4.040000 3.440000
1.679225 4.040000 3.440000
1.691732 4.040000 3.360000
1.703990 3.960000 3.360000
1.720182 3.960000 3.360000
1.732705 3.960000 3.340000
1.745025 3.960000 3.340000
1.757208 3.960000 3.340000
1.769499 3.960000 3.340000
1.781798 3.960000 3.430000
1.794182 4.010000 3.430000
1.810351 4.010000 3.430000
1.822788 4.010000 3.430000
1.835081 4.010000 3.410000
1.847286 4.010000 3.410000
1.859629 4.010000 3.410000
1.871992 4.010000 3.410000
1.884216 4.010000 3.530000
1.900367 4.010000 3.530000
1.912850 4.010000 3.530000
1.925172 4.010000 3.530000
1.937450 4.010000 3.470000
1.949684 4.010000 3.470000
1.961976 4.010000 3.470000
1.974347 4.010000 3.470000
1.990510 4.010000 3.450000
2.002998 4.010000 3.450000
2.015356 4.010000 3.450000
2.031520 4.010000 3.300000
2.043987 4.010000 3.300000
2.056295 4.010000 3.300000
2.072514 3.960000 3.300000
2.084987 3.960000 3.310000
2.097200 3.960000 3.310000
2.109531 3.960000 3.310000
2.121797 3.960000 3.310000
2.134146 3.960000 3.410000
2.146382 3.960000 3.410000
2.158658 4.010000 3.410000
2.170970 4.010000 3.410000
2.183247 4.010000 3.590000
2.195559 4.010000 3.590000
2.207959 4.010000 3.590000
2.220084 4.010000 3.590000
2.232343 4.010000 3.730000
2.244721 3.960000 3.730000
2.256926 3.960000 3.730000
2.273181 3.960000 3.730000
2.285575 3.960000 3.650000
2.297848 3.960000 3.650000
2.310156 3.960000 3.650000
2.322440 3.960000 3.650000
2.334723 3.960000 3.650000
2.347059 3.990000 3.450000
2.363201 3.990000 3.450000
2.375789 3.990000 3.450000
2.388065 3.990000 3.450000
2.400326 3.990000 3.290000
2.412666 3.990000 3.290000
2.424933 3.990000 3.290000
2.437179 4.010000 3.290000
2.453417 4.010000 3.270000
2.465885 4.010000 3.270000
2.478134 4.010000 3.270000
2.490396 4.010000 3.400000
2.502753 4.010000 3.400000
2.515012 4.010000 3.400000
2.527300 4.010000 3.400000
2.543515 4.010000 3.400000
2.555987 4.010000 3.400000
2.568280 4.010000 3.400000
2.584557 4.010000 3.400000
2.596989 4.010000 3.380000
2.609196 4.010000 3.380000
2.621451 3.960000 3.380000
2.633827 3.960000 3.380000
2.646122 3.960000 3.300000
2.658384 3.960000 3.300000
2.670697 3.960000 3.300000
2.682986 3.960000 3.300000
2.695246 3.960000 3.320000
2.707534 4.010000 3.320000
2.719833 4.010000 3.320000
2.732116 4.010000 3.320000
2.744397 4.010000 3.260000
2.756781 4.010000 3.260000
2.768999 4.010000 3.260000
2.785171 4.010000 3.260000
2.797629 3.960000 3.200000
2.809931 3.960000 3.200000
2.822259 3.960000 3.200000
2.834527 3.960000 3.200000
2.846704 3.960000 3.220000
2.858979 3.960000 3.220000
2.875262 3.960000 3.220000
2.887696 4.060000 3.220000
2.900071 4.060000 3.240000
2.912356 4.060000 3.240000
2.924702 4.060000 3.240000
2.936945 4.060000 3.240000
2.949207 4.060000 3.310000
2.965417 4.060000 3.310000
2.977851 4.060000 3.310000
2.990174 3.950000 3.310000
3.002481 3.950000 3.330000
3.014783 3.950000 3.330000
3.027041 3.950000 3.330000
3.039324 3.950000 3.330000
3.055501 3.950000 3.310000
3.067990 3.950000 3.310000
3.080241 4.040000 3.310000
3.096560 4.040000 3.310000
3.109024 4.040000 3.280000
3.121251 4.040000 3.280000
3.133532 4.040000 3.280000
3.145807 4.040000 3.280000
3.158122 4.040000 3.140000
3.170399 4.040000 3.140000
3.182763 3.960000 3.140000
3.194983 3.960000 3.140000
3.207171 3.960000 3.180000
3.219594 3.960000 3.180000
3.231763 3.960000 3.180000
3.244186 3.960000 3.180000
3.256377 3.960000 3.220000
3.268711 4.040000 3.220000
3.280861 4.040000 3.220000
3.293165 4.040000 3.220000
3.305475 4.040000 3.340000
3.317803 4.040000 3.340000
3.330044 4.040000 3.340000
3.342362 4.040000 3.340000
3.354667 4.040000 3.350000
3.366933 3.990000 3.350000
3.379191 3.990000 3.350000
3.391515 3.990000 3.350000
3.403794 3.990000 3.270000
3.416052 3.990000 3.270000
3.428345 3.990000 3.270000
3.440650 3.990000 3.270000
3.456819 3.990000 3.270000
3.469613 3.950000 3.160000
3.481785 3.950000 3.160000
3.493991 3.950000 3.160000
3.506292 3.950000 3.160000
3.518609 3.950000 3.140000
3.530867 3.950000 3.140000
3.547056 3.950000 3.140000
3.559543 4.010000 3.140000
3.571812 4.010000 3.160000
3.588037 4.010000 3.160000
3.600494 4.010000 3.160000
3.612818 4.010000 3.160000
3.625080 4.010000 3.200000
3.637357 4.010000 3.200000
3.649657 3.960000 3.200000
3.661972 3.960000 3.200000
3.678263 3.960000 3.220000
3.690581 3.960000 3.220000
3.702920 3.960000 3.220000
3.715206 3.960000 3.240000
3.727490 3.960000 3.240000
3.739748 4.010000 3.240000
3.752073 4.010000 3.240000
3.764324 4.010000 3.240000
3.776631 4.010000 3.220000
3.788900 4.010000 3.220000
3.801217 4.010000 3.220000
3.813517 4.010000 3.220000
3.825756 4.010000 3.220000
3.838017 4.010000 3.220000
3.850377 4.010000 3.220000
3.862720 4.010000 3.220000
3.878943 4.010000 3.330000
3.891382 4.010000 3.330000
3.903614 4.010000 3.330000
3.915953 4.010000 3.450000
3.928158 4.010000 3.450000
3.940446 4.010000 3.450000
3.952704 4.010000 3.450000
3.968932 4.010000 3.450000
3.981407 4.010000 3.470000
3.993733 4.010000 3.470000
4.005968 4.010000 3.470000
4.018298 4.010000 3.360000
4.030593 4.010000 3.360000
4.042870 4.010000 3.360000
4.059086 4.010000 3.360000
4.071574 4.010000 3.260000
4.083873 4.010000 3.260000
4.100092 4.010000 3.260000
4.112516 3.960000 3.260000
4.124738 3.960000 3.220000
4.137100 3.960000 3.220000
4.149387 3.960000 3.220000
4.161673 3.960000 3.220000
4.173973 3.960000 3.220000
4.190197 3.960000 3.190000
4.202644 4.010000 3.190000
4.214885 4.010000 3.190000
4.227176 4.010000 3.270000
4.239525 4.010000 3.270000
4.251823 4.010000 3.270000
4.264049 4.010000 3.270000
4.276292 4.010000 3.270000
4.288542 3.960000 3.330000
4.300863 3.960000 3.330000
4.313113 3.960000 3.330000
4.325422 3.960000 3.330000
4.337719 3.960000 3.360000
4.350034 3.960000 3.360000
4.362402 3.960000 3.360000
4.374711 4.010000 3.360000
4.390872 4.010000 3.310000
4.403316 4.010000 3.310000
4.415650 4.010000 3.310000
4.431804 4.010000 3.290000
4.444216 4.010000 3.290000
4.456502 4.010000 3.290000
4.468774 4.010000 3.290000
4.481071 4.010000 3.270000
4.493360 4.010000 3.270000
4.505680 4.010000 3.270000
4.521816 4.010000 3.270000
4.534326 4.010000 3.260000
4.550469 4.010000 3.260000
4.563105 4.000000 3.260000
4.575392 4.000000 3.260000
4.591482 4.000000 3.300000
4.604078 4.000000 3.300000
4.616307 4.000000 3.300000
4.632547 4.000000 3.300000
4.645031 4.000000 3.320000
4.657311 3.960000 3.320000
4.673512 3.960000 3.320000
4.686010 3.960000 3.320000
4.702108 3.960000 3.220000
4.714690 3.960000 3.220000
4.726984 3.960000 3.220000
4.743145 4.010000 3.220000
4.755617 4.010000 3.100000
4.767798 4.010000 3.100000
4.784093 4.010000 3.100000
4.796601 4.010000 3.100000
4.812707 4.010000 3.080000
4.825202 4.010000 3.080000
4.837466 4.010000 3.080000
4.853609 4.010000 3.080000
4.866038 4.010000 3.080000
E
pause mouse close