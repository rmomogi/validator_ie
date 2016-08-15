require_relative 'mod_functions'

module ValidatorIE

  class StateRN
    include ActiveModel::Validations
    
    attr_accessor :number
    validates :number, length: { minimum: 9, maximum: 10 }, numericality: true, presence: true
    validate :number_should_code_state
    validate :number_should_mod11

    def initialize(opts={})
      opts.each do |key, value|
        self.public_send("#{key}=", value)
      end
    end

    def number_should_code_state
      number[0..1].eql?('20')
    end

    def number_should_mod11
      result = number_should_modX(11, number.size - 2)
      return if result
      errors.add(:number, 'não é válido para inscrição estadual.')
    end

    private 
    def number_should_modX(mod, at, final = number.size)
      numberX = number.split(//).map(&:to_i)
      sum = ModFunctions.sumX(numberX, at, final) * 10 # One digits
      digit = sum.divmod(mod).last
      digit = digit >= 10 ? 0 : digit
      numberX[at + 1].eql?(digit)
    end
  end

end