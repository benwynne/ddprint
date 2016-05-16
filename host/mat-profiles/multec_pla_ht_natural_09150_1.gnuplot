set grid
set yrange [0:35]

# Startwert steigung
a=0.5

# Startwert y-achse
b=5
f(x)=b+a*(x-205)

fit f(x) "-" using 1:3 via a,b 
205.000000 5.000000 4.13 0.826
207.000000 6.000000 5.39 0.898
209.000000 8.000000 7.10 0.887
211.000000 9.000000 7.86 0.873
213.000000 10.000000 8.73 0.873
215.000000 11.000000 9.51 0.865
217.000000 12.000000 10.55 0.879
219.000000 13.000000 11.50 0.885
221.000000 14.000000 12.31 0.879
223.000000 15.000000 13.14 0.876
225.000000 16.000000 13.97 0.873
227.000000 17.000000 14.70 0.865
229.000000 18.000000 15.51 0.861
231.000000 19.000000 15.97 0.841
233.000000 20.000000 16.72 0.836
235.000000 21.000000 17.61 0.839
237.000000 22.000000 18.10 0.823
239.000000 23.000000 18.74 0.815
241.000000 24.000000 19.55 0.814
243.000000 25.000000 20.61 0.824
245.000000 26.000000 21.57 0.830
247.000000 26.000000 23.14 0.890
249.000000 26.000000 23.33 0.897
251.000000 26.000000 23.23 0.893
253.000000 27.000000 21.80 0.807
255.000000 28.000000 22.36 0.799
257.000000 28.000000 25.09 0.896
259.000000 29.000000 23.85 0.823
E

plot "-" using 1:2 with linespoints title "Target Flowrate", \
     "-" using 1:3 with linespoints title "Actual Flowrate", \
     "-" using 1:3 with linespoints smooth bezier title "Actual Flowrate smooth", \
     f(x) title sprintf("y=B+A*x, A=%.2f, B=%.1f, TempFactor 1/A: %.2f", a, b, 1/a);
205.000000 5.000000 4.13 0.826
207.000000 6.000000 5.39 0.898
209.000000 8.000000 7.10 0.887
211.000000 9.000000 7.86 0.873
213.000000 10.000000 8.73 0.873
215.000000 11.000000 9.51 0.865
217.000000 12.000000 10.55 0.879
219.000000 13.000000 11.50 0.885
221.000000 14.000000 12.31 0.879
223.000000 15.000000 13.14 0.876
225.000000 16.000000 13.97 0.873
227.000000 17.000000 14.70 0.865
229.000000 18.000000 15.51 0.861
231.000000 19.000000 15.97 0.841
233.000000 20.000000 16.72 0.836
235.000000 21.000000 17.61 0.839
237.000000 22.000000 18.10 0.823
239.000000 23.000000 18.74 0.815
241.000000 24.000000 19.55 0.814
243.000000 25.000000 20.61 0.824
245.000000 26.000000 21.57 0.830
247.000000 26.000000 23.14 0.890
249.000000 26.000000 23.33 0.897
251.000000 26.000000 23.23 0.893
253.000000 27.000000 21.80 0.807
255.000000 28.000000 22.36 0.799
257.000000 28.000000 25.09 0.896
259.000000 29.000000 23.85 0.823
E
205.000000 5.000000 4.13 0.826
207.000000 6.000000 5.39 0.898
209.000000 8.000000 7.10 0.887
211.000000 9.000000 7.86 0.873
213.000000 10.000000 8.73 0.873
215.000000 11.000000 9.51 0.865
217.000000 12.000000 10.55 0.879
219.000000 13.000000 11.50 0.885
221.000000 14.000000 12.31 0.879
223.000000 15.000000 13.14 0.876
225.000000 16.000000 13.97 0.873
227.000000 17.000000 14.70 0.865
229.000000 18.000000 15.51 0.861
231.000000 19.000000 15.97 0.841
233.000000 20.000000 16.72 0.836
235.000000 21.000000 17.61 0.839
237.000000 22.000000 18.10 0.823
239.000000 23.000000 18.74 0.815
241.000000 24.000000 19.55 0.814
243.000000 25.000000 20.61 0.824
245.000000 26.000000 21.57 0.830
247.000000 26.000000 23.14 0.890
249.000000 26.000000 23.33 0.897
251.000000 26.000000 23.23 0.893
253.000000 27.000000 21.80 0.807
255.000000 28.000000 22.36 0.799
257.000000 28.000000 25.09 0.896
259.000000 29.000000 23.85 0.823
E
205.000000 5.000000 4.13 0.826
207.000000 6.000000 5.39 0.898
209.000000 8.000000 7.10 0.887
211.000000 9.000000 7.86 0.873
213.000000 10.000000 8.73 0.873
215.000000 11.000000 9.51 0.865
217.000000 12.000000 10.55 0.879
219.000000 13.000000 11.50 0.885
221.000000 14.000000 12.31 0.879
223.000000 15.000000 13.14 0.876
225.000000 16.000000 13.97 0.873
227.000000 17.000000 14.70 0.865
229.000000 18.000000 15.51 0.861
231.000000 19.000000 15.97 0.841
233.000000 20.000000 16.72 0.836
235.000000 21.000000 17.61 0.839
237.000000 22.000000 18.10 0.823
239.000000 23.000000 18.74 0.815
241.000000 24.000000 19.55 0.814
243.000000 25.000000 20.61 0.824
245.000000 26.000000 21.57 0.830
247.000000 26.000000 23.14 0.890
249.000000 26.000000 23.33 0.897
251.000000 26.000000 23.23 0.893
253.000000 27.000000 21.80 0.807
255.000000 28.000000 22.36 0.799
257.000000 28.000000 25.09 0.896
259.000000 29.000000 23.85 0.823
E
