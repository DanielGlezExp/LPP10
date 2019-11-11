require './lib/huella_ambiental'

RSpec.describe HuellaAmbiental do
  before (:all) do
    @carne_vaca = {nombre: "carne_vaca", proteinas: 21.1, carbohidratos: 0.0, lipidos: 3.1, C02: 50.0, terreno: 164.0}
    @nuez = {nombre: "nuez", proteinas: 20.0, carbohidratos: 21.0, lipidos: 54.0, C02: 0.3, terreno: 7.9}

    @comidas = [@carne_vaca, @nuez]
  end
  
  it "has a version number" do
    expect(HuellaAmbiental::VERSION).not_to be nil
  end

  context "Existencia de la clase alimento y sus metodos / atributos" do
    it "La clase esta definida" do
       expect(Object.const_defined?('Alimento')).to be true
    end
  end
end
