module ValidatorIE

  class StateDF
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
      result1 = number_should_modX(11, 10, 9)      
      result2 = number_should_modX(11, 11, 9)      
      return if result1 && result2
      errors.add(:number, 'não é válido para inscrição estadual.')
    end

    private 
    def number_should_mod11_digit(at, weight)
      number_mod11 = number.split(//).map(&:to_i)
      sum = number_mod11[0..at].map.with_index { |v, k| v * WEIGHT[weight][k] }.reduce(:+)
      digit = 11 - sum.divmod(11).last
      digit = digit.eql?(10) || digit.eql?(11) ? 0 : digit      
      unless number_mod11[at + 1].eql?(digit)
        false
      else 
        true
      end
    end

    def number_should_modX(mod, at, final = number.size)
      numberX = number.split(//).map(&:to_i)
      sum = ModFunctions.sumX(numberX, at, final)
      
      digit = mod - sum.divmod(11).last
      digit = digit.eql?(10) || digit.eql?(11) ? 0 : digit  
      numberX[at + 1].eql?(digit)
    end

  end

end