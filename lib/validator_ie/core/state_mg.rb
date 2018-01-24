require_relative 'mod_functions'

module ValidatorIE

  class StateMG
    include ActiveModel::Validations

    attr_accessor :number
    validates :number, length: { minimum: 13, maximum: 13 }, numericality: true, presence: true
    validate :number_should_mod11

    def initialize(opts={})
      opts.each do |key, value|
        self.public_send("#{key}=", value)
      end
    end

    def number_should_mod11
      
      self.number = number[0..2].concat("0").concat(number[3..12])
      matrix = number[0..number.size - 3].split(//).map.with_index {|m, k| k.next.odd? ? 1 : 2}
      result1 = number_should_modX(11, 11, nil, matrix, true)
            
      self.number = number[0..2].concat(number[4..13])
      result2 = number_should_modX(11, 11, 11, nil)

      return if result1 && result2
      errors.add(:number, 'não é válido para inscrição estadual.')

    end

    private 
    def number_should_modX(mod, at, final = number.size, matrix = nil, decimal = false)
      numberX = number.split(//).map(&:to_i)
     
      if decimal
        return false if at > matrix.size - 1
        sum = numberX[0..at].map.with_index { |v, k| v * matrix[k]}.join('').split(//).map(&:to_i).reduce(&:+)
        digit = (sum - (sum.to_s.split(//).last.to_i - 10)) - sum
        digit = (digit == 10 ? 0 : digit)        
      else
        sum = ModFunctions.sumX(numberX, at, final, true, matrix)
        divmod = sum.divmod(mod).last
        digit = divmod < 2 ? 0 : mod - divmod        
      end
      numberX[at + 1].eql?(digit)
    end
  end

end