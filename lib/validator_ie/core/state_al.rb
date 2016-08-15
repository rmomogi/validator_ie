module ValidatorIE

  class StateAL
    include ActiveModel::Validations

    # 0-Normal, 3-Produtor Rural, 5-Substituta, 7- Micro-Empresa Ambulante, 8-Micro-Empresa
    TYPE = [0, 3, 5, 7, 8]

    attr_accessor :number
    validates :number, length: { minimum: 9, maximum: 9 }, numericality: true, presence: true
    validate :number_should_code_state
    validate :number_should_type_factory
    validate :number_should_mod11

    def initialize(opts={})
      opts.each do |key, value|
        self.public_send("#{key}=", value)
      end
    end

    def number_should_code_state
      number[0..1].eql?('24')
    end

    def number_should_type_factory
      TYPE.include? number[2].to_i
    end

    def number_should_mod11
      result = number_should_modX(11, number.size - 2)
      return if result
      errors.add(:number, 'não é válido para inscrição estadual.')
    end

    private 
    def number_should_modX(mod, at, final = number.size)
      numberX = number.split(//).map(&:to_i)
      sum = ModFunctions.sumX(numberX, at, final) * 10
      
      digit = sum - (sum/11) * 11
      digit = digit.eql?(10) ? 0 : digit
      return numberX[at + 1].eql?(digit)
    end

  end
  
end