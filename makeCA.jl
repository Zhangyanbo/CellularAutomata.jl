# 根据index生成规则矩阵
function makeRule(index)
  temp = digits(index, 2, 8)
  result = Array(Int8, 2, 2, 2)

  n = 0;
  for i = 1:2, j = 1:2, k = 1:2
    n += 1
    result[i, j, k] = temp[n]
  end
  return result
end

# 规则对象
type CARule
  rule_list

  function CARule(index)
    if (index < 256 && index >= 0)
      new(makeRule(index))
    else
      error("Out of range")
    end
  end
end

# 获取规则，以01标记之，较为符合直觉
function RunRule(rule::CARule, l::Int, c::Int, r::Int)
  return rule.rule_list[l+1, c+1, r+1]
end
