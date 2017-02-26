

set grid
set yrange [0:35]

# BaseTemp=190

# Startwert steigung
a=0.5

# Startwert y-achse
b=5
f(x)=b+a*(x-190)

fit f(x) "-" using 1:3 noerror via a,b
189.875801 0.962113 0.828003 0.860609
195.037548 4.232364 3.686457 0.871016
198.851034 4.991593 4.113893 0.824164
204.314991 5.734157 4.959325 0.864874
209.336504 6.765291 5.678623 0.839376
213.348848 8.371404 6.713152 0.801915
218.480785 9.443494 7.703535 0.815751
222.814060 10.928815 8.696578 0.795748
228.020271 12.095480 9.580999 0.792114
233.019737 13.216866 11.118233 0.841216
237.555936 14.578315 12.449397 0.853967
242.865287 15.855358 12.710040 0.801624
247.580712 17.182314 13.853717 0.806278
252.324219 18.337268 14.555628 0.793773
257.536765 19.339095 16.576879 0.857169
E

plot "-" using 1:2 with linespoints title "Target Flowrate", \
     "-" using 1:3 with linespoints title "Actual Flowrate", \
     "-" using 1:3 with linespoints smooth bezier title "Actual Flowrate smooth", \
     f(x) title sprintf("y=B+A*x, A=%.2f, B=%.1f, TempFactor 1/A: %.2f", a, b, 1/a)
189.875801 0.962113 0.828003 0.860609
195.037548 4.232364 3.686457 0.871016
198.851034 4.991593 4.113893 0.824164
204.314991 5.734157 4.959325 0.864874
209.336504 6.765291 5.678623 0.839376
213.348848 8.371404 6.713152 0.801915
218.480785 9.443494 7.703535 0.815751
222.814060 10.928815 8.696578 0.795748
228.020271 12.095480 9.580999 0.792114
233.019737 13.216866 11.118233 0.841216
237.555936 14.578315 12.449397 0.853967
242.865287 15.855358 12.710040 0.801624
247.580712 17.182314 13.853717 0.806278
252.324219 18.337268 14.555628 0.793773
257.536765 19.339095 16.576879 0.857169
E
189.875801 0.962113 0.828003 0.860609
195.037548 4.232364 3.686457 0.871016
198.851034 4.991593 4.113893 0.824164
204.314991 5.734157 4.959325 0.864874
209.336504 6.765291 5.678623 0.839376
213.348848 8.371404 6.713152 0.801915
218.480785 9.443494 7.703535 0.815751
222.814060 10.928815 8.696578 0.795748
228.020271 12.095480 9.580999 0.792114
233.019737 13.216866 11.118233 0.841216
237.555936 14.578315 12.449397 0.853967
242.865287 15.855358 12.710040 0.801624
247.580712 17.182314 13.853717 0.806278
252.324219 18.337268 14.555628 0.793773
257.536765 19.339095 16.576879 0.857169
E
189.875801 0.962113 0.828003 0.860609
195.037548 4.232364 3.686457 0.871016
198.851034 4.991593 4.113893 0.824164
204.314991 5.734157 4.959325 0.864874
209.336504 6.765291 5.678623 0.839376
213.348848 8.371404 6.713152 0.801915
218.480785 9.443494 7.703535 0.815751
222.814060 10.928815 8.696578 0.795748
228.020271 12.095480 9.580999 0.792114
233.019737 13.216866 11.118233 0.841216
237.555936 14.578315 12.449397 0.853967
242.865287 15.855358 12.710040 0.801624
247.580712 17.182314 13.853717 0.806278
252.324219 18.337268 14.555628 0.793773
257.536765 19.339095 16.576879 0.857169
E
pause mouse close