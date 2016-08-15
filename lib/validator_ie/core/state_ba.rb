module ValidatorIE

  class StateBA
    include ActiveModel::Validations

    MOD10  = [0,1,2,3,4,5,8]

    attr_accessor :number
    validates :number, length: { minimum: 8, maximum: 9 }, numericality: true, presence: true
    validate :number_should_mod

    def initialize(opts={})
      opts.each do |key, value|
        self.public_send("#{key}=", value)
      end
    end

    def number_should_mod
      if MOD10.include? number[0].to_i
        result = number_should_modX(10, number.size == 8 ? 5 : 6)
      else
        result = number_should_modX(11, number.size == 8 ? 5 : 6)
      end

      return if result
      errors.add(:number, 'não é válido para inscrição estadual.')
    end

    private 
    def number_should_modX(mod, at, final = number.size)
      numberX = number.split(//).map(&:to_i)
      sum = ModFunctions.sumX(numberX, at, final)
      
      divmod = sum.divmod(mod).last
      digit2 = divmod.zero? ? 0 : mod - sum.divmod(mod).last
      return unless numberX[at + 2].eql?(digit2) # Second digit
      
      numberX2 = numberX[0..at] << digit2
      sum = ModFunctions.sumX(numberX2, at + 1, final)
      digit1 = mod - sum.divmod(mod).last
      
      numberX[at + 1].eql?(digit1) # Firs digit
    end

  end

end