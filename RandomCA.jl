include("CellularAutomata.jl")

rCA = CARunNTimes(110, [rand()<0.5?0:1 for i = 1:1000], 1000)

writecsv("E:\\GitHub\\CellularAutomata\\ca_out.csv",rCA)

# draw image in Mathematica by running: ArrayPlot[Import["E:\\GitHub\\CellularAutomata\\ca_out.csv", "CSV"]]
