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

function line_mat_d(mat, p, d)
  move = [digits(i, d, 2) for i = 0:d^2 - 1]

  data = fill(0, length(move))
  for i = 1:length(move)
    data[i] = mat[(p + move[i])...]
  end

  return data
end

function only_count_num(mat, st, d)
  doter = [2^i for i = 0:d^2 - 1];
  types = fill(-1, 2^(d^2));

  k = 0;
  for i = st:size(mat)[1]- d - 1, j = 2:size(mat)[2]- d - 1
    p = dot(line_mat_d(mat, [i, j], d), doter);
    t = false;
    for j = 1:k
      if types[j] == p
        t = true;
      end
    end
    if !t
      k += 1;
      types[k] = p;
    end
  end

  return k
  #return types
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
