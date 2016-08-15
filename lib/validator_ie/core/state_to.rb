require_relative 'mod_functions'

module ValidatorIE

  class StateTO
    include ActiveModel::Validations

    attr_accessor :number
    validates :number, length: { minimum: 11, maximum: 11 }, numericality: true, presence: true
    validate :number_should_mod11

    def initialize(opts={})
      opts.each do |key, value|
        self.public_send("#{key}=", value)
      end
    end

    def number_should_mod11
      self.number = number.split(//).map.with_index {|m, k| m unless k == 2 || k == 3}.compact!.join('')
      result = number_should_modX(11, 7)
      return if result
      errors.add(:number, 'não é válido para inscrição estadual.')
    end

    private 
    def number_should_modX(mod, at, final = number.size)
      numberX = number.split(//).map(&:to_i)
      sum = ModFunctions.sumX(numberX, at, final)
      divmod = sum.divmod(mod).last
      digit = divmod < 2 ? 0 : mod - divmod
      numberX[at + 1].eql?(digit)
    end
  end

end