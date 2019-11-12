require './lib/huella_ambiental'

RSpec.describe HuellaAmbiental do
  before (:all) do
    @hash_carne_vaca = {nombre: "carne_vaca", proteinas: 21.1, carbohidratos: 0.0, lipidos: 3.1, co2: 50.0, terreno: 164.0, cantidad: 1.0}
    @hash_nuez = {nombre: "nuez", proteinas: 20.0, carbohidratos: 21.0, lipidos: 54.0, co2: 0.3, terreno: 7.9, cantidad: 1.0}

    @array_datos_comida = [@hash_carne_vaca, @hash_nuez]

    @hash_alimentos = {}

    @array_datos_comida.each do |datos_alimento|
      @hash_alimentos[datos_alimento[:nombre].to_sym] = Alimento.new(datos_alimento) 
    end   
  end
  
  it "has a version number" do
    expect(HuellaAmbiental::VERSION).not_to be nil
  end

  context "Crear alimentos" do
    it "Puedo crear un alimento" do
      expect(Alimento.new("nuez", 20.0, 21.0, 54.0, 0.3, 7.9, 1.0).instance_of?(Alimento)).to be true
    end
    it "Puedo crear un alimento a partir de un hash" do
      expect(Alimento.new(@hash_nuez).instance_of?(Alimento)).to be true 
    end

    it "Puedo crear un hash de instancias de Alimento" do
      hash_prueba = {}
      @array_datos_comida.each do |datos_alimento|
        hash_prueba[datos_alimento[:nombre].to_sym] = Alimento.new(datos_alimento) 
      end
    end

  end

  context "Existencia de la clase alimento y sus metodos / atributos" do
    it "La clase alimento esta definida" do
       expect(Object.const_defined?('Alimento')).to be true
    end
   # it "La clase alimento tiene un nombre para alimento" do
      
    #end
  end

end
