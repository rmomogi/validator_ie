require 'spec_helper'

describe ValidatorIE do
  
  describe "State Acre", :ac => true do
    it 'should to validate IE from state Acre' do
      expect(ValidatorIE::valid?('0100512033990','AC')).to eq(true)
    end

    it 'do not should to validate IE from state Acre' do
      expect(ValidatorIE::valid?('9100482300112','AC')).to eq(false)
      puts ValidatorIE::errors.full_messages
    end

    it 'do not should to validate IE from state Acre with too short' do
      expect(ValidatorIE::valid?('0142169839','AC')).to eq(false)
    end

    it 'do not should to validate IE from state Acre with too large' do
      expect(ValidatorIE::valid?('0142169839999','AC')).to eq(false)
    end
  end

  describe "State Alagoas", :al => true do
    it 'should to validate IE from state Alagoas' do
      expect(ValidatorIE::valid?('248372076','AL')).to eq(true)
    end

    it 'do not should to validate IE from state Alagoas' do
      expect(ValidatorIE::valid?('348652656','AL')).to eq(false)
    end

    it 'do not should to validate IE from state Alagoas with too short' do
      expect(ValidatorIE::valid?('01421698','AL')).to eq(false)
    end

    it 'do not should to validate IE from state Alagoas with too large' do
      expect(ValidatorIE::valid?('2486526569999','AL')).to eq(false)
    end
  end

  describe "State Amapá", :ap => true do
    it 'should to validate IE from state Amapá' do
      expect(ValidatorIE::valid?('039102173','AP')).to eq(true)
    end

    it 'do not should to validate IE from state Amapá' do
      expect(ValidatorIE::valid?('348652656','AP')).to eq(false)
    end

    it 'do not should to validate IE from state Amapá with too short' do
      expect(ValidatorIE::valid?('01421698','AP')).to eq(false)
    end

    it 'do not should to validate IE from state Amapá with too large' do
      expect(ValidatorIE::valid?('2486526569999','AP')).to eq(false)
    end
  end

  describe "State Amazonas", :am => true do
    it 'should to validate IE from state Amazonas' do
      expect(ValidatorIE::valid?('804076308','AM')).to eq(true)
    end

    it 'do not should to validate IE from state Amazonas' do
      expect(ValidatorIE::valid?('974232681','AM')).to eq(false)
    end

    it 'do not should to validate IE from state Amazonas with too short' do
      expect(ValidatorIE::valid?('07423268','AM')).to eq(false)
    end

    it 'do not should to validate IE from state Amazonas with too large' do
      expect(ValidatorIE::valid?('0742326819999','AM')).to eq(false)
    end
  end

  describe "State Bahia", :ba => true do
    it 'should to validate IE from state Bahia with MOD10' do
      expect(ValidatorIE::valid?('84364177','BA')).to eq(true)
    end

    it 'should to validate IE from state Bahia with MOD11' do
      expect(ValidatorIE::valid?('65929888','BA')).to eq(true)
    end

    it 'do not should to validate IE from state Bahia' do
      expect(ValidatorIE::valid?('12345690','BA')).to eq(false)
    end

    it 'do not should to validate IE from state Bahia with too short' do
      expect(ValidatorIE::valid?('4578396','BA')).to eq(false)
    end

    it 'do not should to validate IE from state Bahia with too large' do
      expect(ValidatorIE::valid?('457839689999','BA')).to eq(false)
    end
  end

  describe "State Ceará", :ce => true do
    it 'should to validate IE from state Ceará' do
      expect(ValidatorIE::valid?('112056873','CE')).to eq(true)
    end

    it 'do not should to validate IE from state Ceará' do
      expect(ValidatorIE::valid?('784919248','CE')).to eq(false)
    end

    it 'do not should to validate IE from state Ceará with too short' do
      expect(ValidatorIE::valid?('78491924','CE')).to eq(false)
    end

    it 'do not should to validate IE from state Ceará with too large' do
      expect(ValidatorIE::valid?('7849192409999','CE')).to eq(false)
    end
  end

  describe "State Distrito Federal", :df => true do
    it 'should to validate IE from state Distrito Federal' do
      expect(ValidatorIE::valid?('0705633200102','DF')).to eq(true)
    end

    it 'do not should to validate IE from state Distrito Federal' do
      expect(ValidatorIE::valid?('0777651200106','DF')).to eq(false)
    end

    it 'do not should to validate IE from state Distrito Federal with too short' do
      expect(ValidatorIE::valid?('077765120010','DF')).to eq(false)
    end

    it 'do not should to validate IE from state Distrito Federal with too large' do
      expect(ValidatorIE::valid?('07776512001089999','DF')).to eq(false)
    end
  end

  describe "State Espirito Santo", :es => true do
    it 'should to validate IE from state Espirito Santo' do
      expect(ValidatorIE::valid?('841354057','ES')).to eq(true)
    end

    it 'do not should to validate IE from state Espirito Santo' do
      expect(ValidatorIE::valid?('965682835','ES')).to eq(false)
    end

    it 'do not should to validate IE from state Espirito Santo with too short' do
      expect(ValidatorIE::valid?('96568283','ES')).to eq(false)
    end

    it 'do not should to validate IE from state Espirito Santo with too large' do
      expect(ValidatorIE::valid?('9656828389999','ES')).to eq(false)
    end
  end

  describe "State Goias", :go => true do
    it 'should to validate IE from state Goias' do
      expect(ValidatorIE::valid?('153735937','GO')).to eq(true)
    end

    it 'should to validate IE from state Goias specified 110944020' do
      expect(ValidatorIE::valid?('110944020','GO')).to eq(true)
    end

    it 'should to validate IE from state Goias specified 110944021' do
      expect(ValidatorIE::valid?('110944021','GO')).to eq(true)
    end

    it 'should to validate IE from state Goias between 10103105 and 10119997' do
      expect(ValidatorIE::valid?('101031051','GO')).to eq(true)
    end

    it 'do not should to validate IE from state Goias' do
      expect(ValidatorIE::valid?('965682835','GO')).to eq(false)
    end

    it 'do not should to validate IE from state Goias with too short' do
      expect(ValidatorIE::valid?('96568283','GO')).to eq(false)
    end

    it 'do not should to validate IE from state Goias with too large' do
      expect(ValidatorIE::valid?('9656828389999','GO')).to eq(false)
    end
  end

  describe "State Maranhão", :ma => true do
    it 'should to validate IE from state Maranhão' do
      expect(ValidatorIE::valid?('128942827','MA')).to eq(true)
    end

    it 'do not should to validate IE from state Maranhão' do
      expect(ValidatorIE::valid?('127682620','MA')).to eq(false)
    end

    it 'do not should to validate IE from state Maranhão with too short' do
      expect(ValidatorIE::valid?('12768262','MA')).to eq(false)
    end

    it 'do not should to validate IE from state Maranhão with too large' do
      expect(ValidatorIE::valid?('1276826279999','MA')).to eq(false)
    end
  end

  describe "State Mato Grosso", :mt => true do
    it 'should to validate IE from state Mato Grosso' do
      expect(ValidatorIE::valid?('00130000019','MT')).to eq(true)
    end

    it 'do not should to validate IE from state Mato Grosso' do
      expect(ValidatorIE::valid?('00130000015','MT')).to eq(false)
    end

    it 'do not should to validate IE from state Mato Grosso with too short' do
      expect(ValidatorIE::valid?('0013000001','MT')).to eq(false)
    end

    it 'do not should to validate IE from state Mato Grosso with too large' do
      expect(ValidatorIE::valid?('001300000199999','MT')).to eq(false)
    end
  end

  describe "State Mato Grosso do Sul", :ms => true do
    it 'should to validate IE from state Mato Grosso do Sul' do
      expect(ValidatorIE::valid?('289044430','MS')).to eq(true)
    end

    it 'do not should to validate IE from state Mato Grosso do Sul' do
      expect(ValidatorIE::valid?('289044438','MS')).to eq(false)
    end

    it 'do not should to validate IE from state Mato Grosso do Sul with too short' do
      expect(ValidatorIE::valid?('28904443','MS')).to eq(false)
    end

    it 'do not should to validate IE from state Mato Grosso do Sul with too large' do
      expect(ValidatorIE::valid?('2890444309999','MS')).to eq(false)
    end
  end

  describe "State Minas Gerais", :mg => true do
    it 'should to validate IE from state Minas Gerais' do
      expect(ValidatorIE::valid?('1253636203030','MG')).to eq(true)
    end

    it 'do not should to validate IE from state Minas Gerais' do
      expect(ValidatorIE::valid?('0623079040089','MG')).to eq(false)
    end

    it 'do not should to validate IE from state Minas Gerais with too short' do
      expect(ValidatorIE::valid?('062307904008','MG')).to eq(false)
    end

    it 'do not should to validate IE from state Minas Gerais with too large' do
      expect(ValidatorIE::valid?('06230790400819999','MG')).to eq(false)
    end
  end

  describe "State Pará", :pa => true do
    it 'should to validate IE from state Pará' do
      expect(ValidatorIE::valid?('159999995','PA')).to eq(true)
    end

    it 'do not should to validate IE from state Pará' do
      expect(ValidatorIE::valid?('159999990','PA')).to eq(false)
    end

    it 'do not should to validate IE from state Pará with too short' do
      expect(ValidatorIE::valid?('15999999','PA')).to eq(false)
    end

    it 'do not should to validate IE from state Pará with too large' do
      expect(ValidatorIE::valid?('1599999959999','PA')).to eq(false)
    end
  end

  describe "State Paraíba", :pb => true do
    it 'should to validate IE from state Paraíba' do
      expect(ValidatorIE::valid?('060000015','PB')).to eq(true)
    end

    it 'do not should to validate IE from state Paraíba' do
      expect(ValidatorIE::valid?('060000018','PB')).to eq(false)
    end

    it 'do not should to validate IE from state Paraíba with too short' do
      expect(ValidatorIE::valid?('06000001','PB')).to eq(false)
    end

    it 'do not should to validate IE from state Paraíba with too large' do
      expect(ValidatorIE::valid?('0600000159999','PB')).to eq(false)
    end
  end

  describe "State Pernambuco", :pe => true do
    it 'should to validate IE from state Pernambuco' do
      expect(ValidatorIE::valid?('755927206','PE')).to eq(true)
    end

    it 'do not should to validate IE from state Pernambuco' do
      expect(ValidatorIE::valid?('032141849','PE')).to eq(false)
    end

    it 'do not should to validate IE from state Pernambuco with too short' do
      expect(ValidatorIE::valid?('03214184','PE')).to eq(false)
    end

    it 'do not should to validate IE from state Pernambuco with too large' do
      expect(ValidatorIE::valid?('0321418409999','PE')).to eq(false)
    end
  end

  describe "State Piauí", :pi => true do
    it 'should to validate IE from state Piauí' do
      expect(ValidatorIE::valid?('012345679','PI')).to eq(true)
    end

    it 'do not should to validate IE from state Piauí' do
      expect(ValidatorIE::valid?('012345676','PI')).to eq(false)
    end

    it 'do not should to validate IE from state Piauí with too short' do
      expect(ValidatorIE::valid?('01234567','PI')).to eq(false)
    end

    it 'do not should to validate IE from state Piauí with too large' do
      expect(ValidatorIE::valid?('0123456799999','PI')).to eq(false)
    end
  end

  describe "State Rio de Janeiro", :rj => true do
    it 'should to validate IE from state Rio de Janeiro' do
      expect(ValidatorIE::valid?('45673600','RJ')).to eq(true)
    end

    it 'do not should to validate IE from state Rio de Janeiro' do
      expect(ValidatorIE::valid?('33869978','RJ')).to eq(false)
    end

    it 'do not should to validate IE from state Rio de Janeiro with too short' do
      expect(ValidatorIE::valid?('3386997','RJ')).to eq(false)
    end

    it 'do not should to validate IE from state Rio de Janeiro with too large' do
      expect(ValidatorIE::valid?('338699759999','RJ')).to eq(false)
    end
  end

  describe "State Rio Grande do Norte", :rn => true do
    it 'should to validate IE from state Rio Grande do Norte with 9 digits' do
      expect(ValidatorIE::valid?('200400401','RN')).to eq(true)
    end

    it 'should to validate IE from state Rio Grande do Norte with 10 digits' do
      expect(ValidatorIE::valid?('2000400400','RN')).to eq(true)
    end

    it 'do not should to validate IE from state Rio Grande do Norte' do
      expect(ValidatorIE::valid?('200400409','RN')).to eq(false)
    end

    it 'do not should to validate IE from state Rio Grande do Norte with too short' do
      expect(ValidatorIE::valid?('20040040','RN')).to eq(false)
    end

    it 'do not should to validate IE from state Rio Grande do Norte with too large' do
      expect(ValidatorIE::valid?('2004004019999','RN')).to eq(false)
    end
  end

  describe "State Rio Grande do Sul", :rs => true do
    it 'should to validate IE from state Rio Grande do Sul' do
      expect(ValidatorIE::valid?('2296063130','RS')).to eq(true)
    end

    it 'do not should to validate IE from state Rio Grande do Sul' do
      expect(ValidatorIE::valid?('2243658798','RS')).to eq(false)
    end

    it 'do not should to validate IE from state Rio Grande do Sul with too short' do
      expect(ValidatorIE::valid?('224365879','RS')).to eq(false)
    end

    it 'do not should to validate IE from state Rio Grande do Sul with too large' do
      expect(ValidatorIE::valid?('2243658792999','RS')).to eq(false)
    end
  end

  describe "State Rondônia", :ro => true do
    it 'should to validate IE from state Rondônia with 9 digits' do
      expect(ValidatorIE::valid?('101625213','RO')).to eq(true)
    end

    it 'should to validate IE from state Rondônia with 14 digits' do
      expect(ValidatorIE::valid?('50618512794689','RO')).to eq(true)
    end

    it 'do not should to validate IE from state Rondônia' do
      expect(ValidatorIE::valid?('101625217','RO')).to eq(false)
    end

    it 'do not should to validate IE from state Rondônia with too short' do
      expect(ValidatorIE::valid?('10162521','RO')).to eq(false)
    end

    it 'do not should to validate IE from state Rondônia with too large' do
      expect(ValidatorIE::valid?('1016252139999','RO')).to eq(false)
    end
  end

  describe "State Roraima", :rr => true do
    it 'should to validate IE from state Roraima with 7 digits' do
      expect(ValidatorIE::valid?('240061536','RR')).to eq(true)
    end

    it 'do not should to validate IE from state Roraima' do
      expect(ValidatorIE::valid?('240066289','RR')).to eq(false)
    end

    it 'do not should to validate IE from state Roraima with too short' do
      expect(ValidatorIE::valid?('24006628','RR')).to eq(false)
    end

    it 'do not should to validate IE from state Roraima with too large' do
      expect(ValidatorIE::valid?('2400662819999','RR')).to eq(false)
    end
  end

  describe "State Santa Catarina", :sc => true do
    it 'should to validate IE from state Santa Catarina with 9 digits' do
      expect(ValidatorIE::valid?('954402553','SC')).to eq(true)
    end

    it 'do not should to validate IE from state Santa Catarina' do
      expect(ValidatorIE::valid?('251040858','SC')).to eq(false)
    end

    it 'do not should to validate IE from state Santa Catarina with too short' do
      expect(ValidatorIE::valid?('25104085','SC')).to eq(false)
    end

    it 'do not should to validate IE from state Santa Catarina with too large' do
      expect(ValidatorIE::valid?('2510408529999','SC')).to eq(false)
    end
  end

  describe "State São Paulo", :sp => true do
    it 'should to validate IE from state São Paulo with 12 digits' do
      expect(ValidatorIE::valid?('881682814174','SP')).to eq(true)
    end

    it 'do not should to validate IE from state São Paulo' do
      expect(ValidatorIE::valid?('110042490116','SP')).to eq(false)
    end

    it 'do not should to validate IE from state São Paulo with too short' do
      expect(ValidatorIE::valid?('11004249011','SP')).to eq(false)
    end

    it 'do not should to validate IE from state São Paulo with too large' do
      expect(ValidatorIE::valid?('1100424901149999','SP')).to eq(false)
    end
  end

  describe "State Sergipe", :se => true do
    it 'should to validate IE from state Sergipe with 9 digits' do
      expect(ValidatorIE::valid?('005847060','se')).to eq(true)
    end

    it 'do not should to validate IE from state Sergipe' do
      expect(ValidatorIE::valid?('271234569','se')).to eq(false)
    end

    it 'do not should to validate IE from state Sergipe with too short' do
      expect(ValidatorIE::valid?('27123456','se')).to eq(false)
    end

    it 'do not should to validate IE from state Sergipe with too large' do
      expect(ValidatorIE::valid?('271234569999','se')).to eq(false)
    end
  end

  describe "State Tocantins", :to => true do
    it 'should to validate IE from state Tocantins with 11 digits' do
      expect(ValidatorIE::valid?('10033738770','to')).to eq(true)
    end

    it 'do not should to validate IE from state Tocantins' do
      expect(ValidatorIE::valid?('29010227839','to')).to eq(false)
    end

    it 'do not should to validate IE from state Tocantins with too short' do
      expect(ValidatorIE::valid?('2901022783','to')).to eq(false)
    end

    it 'do not should to validate IE from state Tocantins with too large' do
      expect(ValidatorIE::valid?('290102278369999','to')).to eq(false)
    end
  end

end
