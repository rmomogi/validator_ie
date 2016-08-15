require_relative 'mod_functions'

module ValidatorIE

  class StateRO
    include ActiveModel::Validations
    
    attr_accessor :number
    validates :number, length: { minimum: 9, maximum: 14 }, numericality: true, presence: true
    validate :number_should_mod11

    def initialize(opts={})
      opts.each do |key, value|
        self.public_send("#{key}=", value)
      end
    end

    def number_should_mod11
      unless number.size == 14
        nOr = number
        nOr = nOr[3..nOr.size].to_s.rjust(14, "0") # Fix to 14 digits
        self.number = nOr
      end      
      result = number_should_modX(11, number.size - 2, 9)
      return if result
      errors.add(:number, 'não é válido para inscrição estadual.')
    end

    private 
    def number_should_modX(mod, at, final = number.size)
      numberX = number.split(//).map(&:to_i)
      sum = ModFunctions.sumX(numberX, at, final)
      digit = 11 - sum.divmod(mod).last
      numberX[at + 1].eql?(digit)
    end
  end

end