

set grid
set yrange [0:35]

# BaseTemp=210

# Startwert steigung
a=0.5

# Startwert y-achse
b=5
f(x)=b+a*(x-210)

fit f(x) "-" using 1:3 noerror via a,b
209.265958 2.773010 2.495530 0.899935
214.106022 3.888448 3.499322 0.899928
219.147351 4.909394 4.415867 0.899473
224.268591 5.741479 5.166867 0.899919
229.245991 6.392849 5.753242 0.899950
233.659673 7.374509 6.635173 0.899744
239.310189 8.226361 7.398031 0.899308
244.539100 9.011098 8.107838 0.899761
248.962969 9.857451 8.864444 0.899263
254.059017 10.784214 9.704659 0.899895
259.204836 11.604221 10.441066 0.899765
E

plot "-" using 1:2 with linespoints title "Target Flowrate", \
     "-" using 1:3 with linespoints title "Actual Flowrate", \
     "-" using 1:3 with linespoints smooth bezier title "Actual Flowrate smooth", \
     f(x) title sprintf("y=B+A*x, A=%.2f, B=%.1f, TempFactor 1/A: %.2f", a, b, 1/a)
209.265958 2.773010 2.495530 0.899935
214.106022 3.888448 3.499322 0.899928
219.147351 4.909394 4.415867 0.899473
224.268591 5.741479 5.166867 0.899919
229.245991 6.392849 5.753242 0.899950
233.659673 7.374509 6.635173 0.899744
239.310189 8.226361 7.398031 0.899308
244.539100 9.011098 8.107838 0.899761
248.962969 9.857451 8.864444 0.899263
254.059017 10.784214 9.704659 0.899895
259.204836 11.604221 10.441066 0.899765
E
209.265958 2.773010 2.495530 0.899935
214.106022 3.888448 3.499322 0.899928
219.147351 4.909394 4.415867 0.899473
224.268591 5.741479 5.166867 0.899919
229.245991 6.392849 5.753242 0.899950
233.659673 7.374509 6.635173 0.899744
239.310189 8.226361 7.398031 0.899308
244.539100 9.011098 8.107838 0.899761
248.962969 9.857451 8.864444 0.899263
254.059017 10.784214 9.704659 0.899895
259.204836 11.604221 10.441066 0.899765
E
209.265958 2.773010 2.495530 0.899935
214.106022 3.888448 3.499322 0.899928
219.147351 4.909394 4.415867 0.899473
224.268591 5.741479 5.166867 0.899919
229.245991 6.392849 5.753242 0.899950
233.659673 7.374509 6.635173 0.899744
239.310189 8.226361 7.398031 0.899308
244.539100 9.011098 8.107838 0.899761
248.962969 9.857451 8.864444 0.899263
254.059017 10.784214 9.704659 0.899895
259.204836 11.604221 10.441066 0.899765
E
pause mouse close