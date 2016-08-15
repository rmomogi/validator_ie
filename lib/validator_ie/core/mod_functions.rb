module ModFunctions

  def self.matrix_weight(size, final, reverse)
    count = initial = (reverse ? 1 : 0)
    matrix = []    
    (size).times do |i|
      count += 1
      count = count > final ? initial + 1 : count 
      matrix << count
    end
    return (reverse ? matrix.reverse : matrix)
  end

  def self.sumX(number, at, final, reverse = true, matrix = nil)
    weight = matrix.nil? ? matrix_weight(at + 1, final, reverse) : matrix
    return 0 if at > weight.size - 1
    sum = number[0..at].map.with_index { |v, k| v * weight[k]}.reduce(:+)
  end

end