module ValidatorIE

  class StateGO
    include ActiveModel::Validations

    attr_accessor :number
    validates :number, length: { minimum: 9, maximum: 9 }, numericality: true, presence: true
    validate :number_should_code_state
    validate :number_should_mod11


    def initialize(opts={})
      opts.each do |key, value|
        self.public_send("#{key}=", value)
      end
    end

    def number_should_code_state
      number[0..1].eql?('10') || number[0..1].eql?('11') ||  number[0..1].eql?('15')
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
      divmod = sum.divmod(mod).last

      if number[0..at].eql? '11094402'
        unless numberX[at + 1].eql?(0) || numberX[at + 1].eql?(1)
          false
        else 
          true
        end
      elsif number[0..at].to_i.between?(10103105, 10119997)
        unless numberX[at + 1].eql?(1)
          false
        else 
          true
        end
      else
        digit =  mod - divmod  
        digit = digit.eql?(1) ? 0 : digit  
        numberX[at + 1].eql?(digit)
      end
    end

  end

end