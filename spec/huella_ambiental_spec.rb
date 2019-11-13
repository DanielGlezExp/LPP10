require './lib/huella_ambiental'

RSpec.describe Dieta do
  before (:all) do
    hash_carne_vaca = {nombre: "carne_vaca", proteinas: 21.1, carbohidratos: 0.0, lipidos: 3.1, co2: 50.0, terreno: 164.0, cantidad: 1.0}
    hash_chocolate = {nombre: "chocolate", proteinas: 5.3, carbohidratos: 47.0, lipidos: 30.0, co2: 2.3, terreno: 3.4, cantidad: 1.0}
    hash_tofu = {nombre: "tofu", proteinas: 8.0, carbohidratos: 1.9, lipidos: 4.8, co2: 2.0, terreno: 2.2, cantidad: 1.0}
    hash_nuez = {nombre: "nuez", proteinas: 20.0, carbohidratos: 21.0, lipidos: 54.0, co2: 0.3, terreno: 7.9, cantidad: 1.0}

    @array_datos_comida = [hash_carne_vaca, hash_chocolate, hash_tofu, hash_nuez]

    hash_alimentos = {}

    @array_datos_comida.each do |datos_alimento|
      hash_alimentos[datos_alimento[:nombre].to_sym] = Alimento.new(datos_alimento)
    end

    alimento_carne_vaca = Alimento.new(hash_carne_vaca)
    alimento_nuez = Alimento.new(hash_nuez)
    
    @array_comidas_prueba = [alimento_nuez, alimento_carne_vaca]
    @dieta_prueba = Dieta.new (@array_comidas_prueba)

    @dieta_hombre = Dieta.new([hash_alimentos[:chocolate]*5, hash_alimentos[:nuez], hash_alimentos[:tofu]])
    @dieta_mujer = Dieta.new([hash_alimentos[:chocolate]*4, hash_alimentos[:nuez]])
  end


  context "Pruebas para la clase Dieta" do
    it "Existe la clase dieta" do
      expect(Object.const_defined?('Dieta')).to be true
    end

    it "Puedo crear una dieta a partir de un array de comidas" do
      expect(Dieta.new(@array_comidas_prueba).instance_of?(Dieta)).to be true
    end

    it "La dieta me devuelve correctamente la cantidad de calorias" do
      expect(@dieta_prueba.valor_energetico.round(1)).to eq(762.3)
    end

    it "La dieta me devuelve correctamente la cantidad de co2" do
      expect(@dieta_prueba.co2.round(1)).to eq(50.3)
    end

    it "La dieta me devuelve correctamente la cantidad de terreno" do
      expect(@dieta_prueba.terreno.round(1)).to eq(171.9)
    end

    it "La dieta se formatea correctamente" do
      expect(@dieta_prueba.to_s).to eq("nuez 1.0kg\ncarne_vaca 1.0kg\n")
    end

  end


  context "Pruebas para el impacto ambiental" do
    it "Impacto ambiental dieta de un hombre" do
      expect(@dieta_hombre.impacto_ambiental).to eq([13.8, 27.1])
    end

    it "Impacto ambiental dieta de una mujer" do
      expect(@dieta_mujer.impacto_ambiental).to eq([9.5, 21.5])
    end
  end


end
