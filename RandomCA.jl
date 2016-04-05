include("Reform.jl")

rCA = CARunNTimes(110, [rand()<0.5?0:1 for i = 1:1000], 1000)

writecsv("E:\\GitHub\\CellularAutomata\\ca_out.csv",rCA)

# draw image in Mathematica by running: ArrayPlot[Import["E:\\GitHub\\CellularAutomata\\ca_out.csv", "CSV"]]

m = getRandomCA(30, 50)

only_count_num(m, 1, 3)

ref = reformer(m, 1)

count_num(ref)

writecsv("E:\\GitHub\\CellularAutomata\\_data\\110.csv", getAllms(ref))

for i = 0:128
  m = getRandomCA(i, 50);
  ref = reformer(m, 5);
  writecsv("E:\\GitHub\\CellularAutomata\\_data\\$i.csv", getAllms(ref));
end
