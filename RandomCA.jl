include("CellularAutomata.jl")

rCA = CARunNTimes(110, [rand()<0.5?0:1 for i = 1:300], 300)

writecsv("E:\\GitHub\\CellularAutomata\\ca_out.csv",rCA)
