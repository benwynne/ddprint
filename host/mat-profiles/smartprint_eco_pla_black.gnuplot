

set grid
set yrange [0:35]

# BaseTemp=190

# Startwert steigung
a=0.5

# Startwert y-achse
b=5
f(x)=b+a*(x-190)

fit f(x) "-" using 1:3 noerror via a,b
189.537806 9.278333 8.098046 0.872791
192.233206 9.295678 8.312006 0.894180
198.742457 10.976048 9.810632 0.893822
202.560764 13.210008 11.399569 0.862949
208.233012 14.578430 13.065484 0.896220
212.039639 16.168498 14.544380 0.899550
217.261402 18.253164 15.875704 0.869751
223.937778 18.703953 16.738348 0.894910
228.421053 18.702174 16.756074 0.895943
233.007675 19.543865 17.240005 0.882119
236.890000 21.464575 18.727323 0.872476
242.306743 22.917273 20.185209 0.880786
247.300955 24.184113 20.645500 0.853680
252.564103 26.223431 22.752495 0.867640
256.984475 28.057077 24.318348 0.866746
E

plot "-" using 1:2 with linespoints title "Target Flowrate", \
     "-" using 1:3 with linespoints title "Actual Flowrate", \
     "-" using 1:3 with linespoints smooth bezier title "Actual Flowrate smooth", \
     f(x) title sprintf("y=B+A*x, A=%.2f, B=%.1f, TempFactor 1/A: %.2f", a, b, 1/a)
189.537806 9.278333 8.098046 0.872791
192.233206 9.295678 8.312006 0.894180
198.742457 10.976048 9.810632 0.893822
202.560764 13.210008 11.399569 0.862949
208.233012 14.578430 13.065484 0.896220
212.039639 16.168498 14.544380 0.899550
217.261402 18.253164 15.875704 0.869751
223.937778 18.703953 16.738348 0.894910
228.421053 18.702174 16.756074 0.895943
233.007675 19.543865 17.240005 0.882119
236.890000 21.464575 18.727323 0.872476
242.306743 22.917273 20.185209 0.880786
247.300955 24.184113 20.645500 0.853680
252.564103 26.223431 22.752495 0.867640
256.984475 28.057077 24.318348 0.866746
E
189.537806 9.278333 8.098046 0.872791
192.233206 9.295678 8.312006 0.894180
198.742457 10.976048 9.810632 0.893822
202.560764 13.210008 11.399569 0.862949
208.233012 14.578430 13.065484 0.896220
212.039639 16.168498 14.544380 0.899550
217.261402 18.253164 15.875704 0.869751
223.937778 18.703953 16.738348 0.894910
228.421053 18.702174 16.756074 0.895943
233.007675 19.543865 17.240005 0.882119
236.890000 21.464575 18.727323 0.872476
242.306743 22.917273 20.185209 0.880786
247.300955 24.184113 20.645500 0.853680
252.564103 26.223431 22.752495 0.867640
256.984475 28.057077 24.318348 0.866746
E
189.537806 9.278333 8.098046 0.872791
192.233206 9.295678 8.312006 0.894180
198.742457 10.976048 9.810632 0.893822
202.560764 13.210008 11.399569 0.862949
208.233012 14.578430 13.065484 0.896220
212.039639 16.168498 14.544380 0.899550
217.261402 18.253164 15.875704 0.869751
223.937778 18.703953 16.738348 0.894910
228.421053 18.702174 16.756074 0.895943
233.007675 19.543865 17.240005 0.882119
236.890000 21.464575 18.727323 0.872476
242.306743 22.917273 20.185209 0.880786
247.300955 24.184113 20.645500 0.853680
252.564103 26.223431 22.752495 0.867640
256.984475 28.057077 24.318348 0.866746
E
pause mouse close