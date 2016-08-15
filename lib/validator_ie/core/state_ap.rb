module ValidatorIE

  class StateAP
    include ActiveModel::Validations
    
    attr_accessor :number
    validates :number, length: { minimum: 9, maximum: 9 }, numericality: true, presence: true
    validate :number_should_code_state
    validate :number_should_range_code
    validate :number_should_mod11

    def initialize(opts={})
      opts.each do |key, value|
        self.public_send("#{key}=", value)
      end
      @p = @d = 0
    end

    def number_should_code_state
      number[0..1].eql?('03')
    end

    def number_should_range_code
      if number.to_i.between?(3000001, 3017000)
          @p = 5
          @d = 0
      elsif number.to_i.between?(3017001, 3019022)
          @p = 9
          @d = 1
      end
    end

    def number_should_mod11
      result = number_should_modX(11, 7)
      return if result
      errors.add(:number, 'não é válido para inscrição estadual.')
    end

    private 
    def number_should_modX(mod, at, final = number.size)
      numberX = number.split(//).map(&:to_i)
      sum = ModFunctions.sumX(numberX, at, final) + @p
      
      digit = mod - sum.divmod(mod).last
      digit = digit.eql?(10) ? 0 : digit
      digit = digit.eql?(11) ? @d : digit
      return numberX[at + 1].eql?(digit) 
    end
  end
  
end