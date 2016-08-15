module ValidatorIE

  class StateAM
    include ActiveModel::Validations

    attr_accessor :number
    validates :number, length: { minimum: 9, maximum: 9 }, numericality: true, presence: true
    validate :number_should_mod11

    def initialize(opts={})
      opts.each do |key, value|
        self.public_send("#{key}=", value)
      end
    end

    def number_should_mod11
      result = number_should_modX(11, 7)      
      return if result
      errors.add(:number, 'não é válido a inscrição estadual.')
    end

    private 
    def number_should_modX(mod, at, final = number.size)
      numberX = number.split(//).map(&:to_i)
      sum = ModFunctions.sumX(numberX, at, final)
      
      if sum < mod
        digit = mod - sum
      else
        digit = sum.divmod(mod).last > 1 ? mod - sum.divmod(mod).last : 0
      end
      return numberX[at + 1].eql?(digit) 
    end

  end

end