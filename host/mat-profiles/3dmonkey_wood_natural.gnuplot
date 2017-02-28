

set grid
set yrange [0:35]

# BaseTemp=190

# Startwert steigung
a=0.5

# Startwert y-achse
b=5
f(x)=b+a*(x-190)

fit f(x) "-" using 1:3 noerror via a,b
190.296224 10.818423 9.590567 0.886503
194.512500 13.214619 11.712075 0.886297
195.308219 13.733830 11.953926 0.870400
202.841595 14.546979 12.479047 0.857845
208.095034 15.275023 13.565399 0.888077
212.747483 15.557654 13.934504 0.895669
219.066639 17.019998 15.151976 0.890245
222.675383 17.866685 15.792776 0.883923
227.777412 18.393918 16.260997 0.884042
232.287581 19.150446 17.232662 0.899857
237.227272 19.786255 17.636756 0.891364
241.805556 20.429490 18.251157 0.893373
250.051752 22.792267 20.412047 0.895569
253.055889 24.116651 21.480572 0.890695
259.854097 26.610382 23.776870 0.893519
E

plot "-" using 1:2 with linespoints title "Target Flowrate", \
     "-" using 1:3 with linespoints title "Actual Flowrate", \
     "-" using 1:3 with linespoints smooth bezier title "Actual Flowrate smooth", \
     f(x) title sprintf("y=B+A*x, A=%.2f, B=%.1f, TempFactor 1/A: %.2f", a, b, 1/a)
190.296224 10.818423 9.590567 0.886503
194.512500 13.214619 11.712075 0.886297
195.308219 13.733830 11.953926 0.870400
202.841595 14.546979 12.479047 0.857845
208.095034 15.275023 13.565399 0.888077
212.747483 15.557654 13.934504 0.895669
219.066639 17.019998 15.151976 0.890245
222.675383 17.866685 15.792776 0.883923
227.777412 18.393918 16.260997 0.884042
232.287581 19.150446 17.232662 0.899857
237.227272 19.786255 17.636756 0.891364
241.805556 20.429490 18.251157 0.893373
250.051752 22.792267 20.412047 0.895569
253.055889 24.116651 21.480572 0.890695
259.854097 26.610382 23.776870 0.893519
E
190.296224 10.818423 9.590567 0.886503
194.512500 13.214619 11.712075 0.886297
195.308219 13.733830 11.953926 0.870400
202.841595 14.546979 12.479047 0.857845
208.095034 15.275023 13.565399 0.888077
212.747483 15.557654 13.934504 0.895669
219.066639 17.019998 15.151976 0.890245
222.675383 17.866685 15.792776 0.883923
227.777412 18.393918 16.260997 0.884042
232.287581 19.150446 17.232662 0.899857
237.227272 19.786255 17.636756 0.891364
241.805556 20.429490 18.251157 0.893373
250.051752 22.792267 20.412047 0.895569
253.055889 24.116651 21.480572 0.890695
259.854097 26.610382 23.776870 0.893519
E
190.296224 10.818423 9.590567 0.886503
194.512500 13.214619 11.712075 0.886297
195.308219 13.733830 11.953926 0.870400
202.841595 14.546979 12.479047 0.857845
208.095034 15.275023 13.565399 0.888077
212.747483 15.557654 13.934504 0.895669
219.066639 17.019998 15.151976 0.890245
222.675383 17.866685 15.792776 0.883923
227.777412 18.393918 16.260997 0.884042
232.287581 19.150446 17.232662 0.899857
237.227272 19.786255 17.636756 0.891364
241.805556 20.429490 18.251157 0.893373
250.051752 22.792267 20.412047 0.895569
253.055889 24.116651 21.480572 0.890695
259.854097 26.610382 23.776870 0.893519
E
pause mouse close