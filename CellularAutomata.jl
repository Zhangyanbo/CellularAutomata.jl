include("makeCA.jl")

function getColor(rul, temp_map, y, x, len)
  lc = 0
  rc = 0
  dc = 0

  dc = temp_map[y, x]

  lc = try
    temp_map[y, x-1]
  catch
    temp_map[y, len]
  end

  rc = try
    temp_map[y, x+1]
  catch
    temp_map[y, 1]
  end

  return rul.rule_list[lc + 1, dc + 1, rc + 1]
end

function CARunNTimes(rul, st, n)
  temp = fill(Int8(0), n + 1, length(st))
  CAru = CARule(rul)

  for i = 1:length(st)
    temp[1, i] = st[i]
  end

  len = length(st)
  for i = 1:n, j = 1:len
    temp[i + 1, j] = getColor(CAru, temp, i, j, len)
  end

  return temp
end
