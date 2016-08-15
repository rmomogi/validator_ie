require "active_model"
require "validator_ie/version"
require "validator_ie/core/state_ac"
require "validator_ie/core/state_al"
require "validator_ie/core/state_ap"
require "validator_ie/core/state_am"
require "validator_ie/core/state_ba"
require "validator_ie/core/state_ce"
require "validator_ie/core/state_df"
require "validator_ie/core/state_es"
require "validator_ie/core/state_go"
require "validator_ie/core/state_ma"
require "validator_ie/core/state_mt"
require "validator_ie/core/state_ms"
require "validator_ie/core/state_mg"
require "validator_ie/core/state_pa"
require "validator_ie/core/state_pb"
require "validator_ie/core/state_pe"
require "validator_ie/core/state_pi"
require "validator_ie/core/state_rj"
require "validator_ie/core/state_rn"
require "validator_ie/core/state_rs"
require "validator_ie/core/state_ro"
require "validator_ie/core/state_rr"
require "validator_ie/core/state_sc"
require "validator_ie/core/state_sp"
require "validator_ie/core/state_se"
require "validator_ie/core/state_to"

module ValidatorIE

  @state = nil

  def self.valid?(number,state)
    name = "State#{state.upcase}"
    begin
      target = Object.const_get("ValidatorIE").const_get(name)
    rescue
      raise "Nome do estado não existente!"   
    end
    @state = target.send("new", {:number => number})
    return @state.send('valid?')
  end

  def self.errors 
    unless @state.nil?
      return @state.errors
    else
      return []
    end 
  end

end
