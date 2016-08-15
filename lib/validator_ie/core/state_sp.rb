require_relative 'mod_functions'

module ValidatorIE

  class StateSP
    include ActiveModel::Validations
    
    MATRIX = [1, 3, 4, 5, 6, 7, 8, 10]

    attr_accessor :number
    validates :number, length: { minimum: 12, maximum: 12 }, numericality: true, presence: true
    validate :number_should_mod11

    def initialize(opts={})
      opts.each do |key, value|
        self.public_send("#{key}=", value)
      end
    end

    def number_should_mod11
      result1 = number_should_modX(11, 7, nil, MATRIX)
      result2 = number_should_modX(11, 10, 10)
      return if result1 && result2
      errors.add(:number, 'não é válido para inscrição estadual.')
    end

    private 
    def number_should_modX(mod, at, final = number.size, matrix = nil)
      numberX = number.split(//).map(&:to_i)
      unless matrix.nil?
        sum = ModFunctions.sumX(numberX, at, final, nil, matrix)
      else
        sum = ModFunctions.sumX(numberX, at, final)
      end
      divmod = sum.divmod(mod).last
      digit = divmod == 10 ? 0 : sum.divmod(mod).last
      numberX[at + 1].eql?(digit)
    end
  end

end