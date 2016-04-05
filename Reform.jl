include("CellularAutomata.jl")

# basic function

getRandomCA(rul, d) = CARunNTimes(rul, [rand()<0.5?0:1 for i = 1:d], d)

# special type

# reform function

function line_mat(mat, point)
  p = fill(1, 9)
  move = [[0,0], [1,0], [2,0], [0,1], [1,1], [2,1], [0,2], [1,2], [2,2]]

  k = 0
  for i = 1:9
    k += 1
    p[k] += mat[(point + move[i])...]
  end

  return p
end

function reformer(mat, st = 1)
  # mat`: Matrix
  # st  : line to start count
  d = fill(2, 9)
  counter = fill(0, d...)

  #return counter

  for i = st:size(mat)[1]-3, j = 2:size(mat)[2]-5
    p = line_mat(mat, [i, j])
    counter[p...] = 1
  end

  return counter
end

# output function

count_num(counter) = sum(counter)

function getAllms(counter)
  data = Array(Any, 2^9)
  k = 0

  for i = 0:2^9-1
    n = 1 + digits(i, 2, 9)
    if counter[n...] == 1
      k += 1
      data[k] = n - 1
    end
  end

  output_temp = fill(0, k, 9)

  for i = 1:k, j = 1:9
    output_temp[i, j] = data[i][j]
  end

  return output_temp
end
