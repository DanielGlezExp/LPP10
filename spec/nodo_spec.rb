require './lib/huella_ambiental'

RSpec.describe Nodo do
  before (:all) do
    hash_carne_vaca = {nombre: "carne_vaca", proteinas: 21.1, carbohidratos: 0.0, lipidos: 3.1, co2: 50.0, terreno: 164.0, cantidad: 1.0}
    hash_carne_cordero = {nombre: "carne_cordero", proteinas: 18.0, carbohidratos: 0.0, lipidos: 17.0, co2: 20.0, terreno: 185.0, cantidad: 1.0}
    hash_camarones = {nombre: "camarones", proteinas: 17.6, carbohidratos: 1.5, lipidos: 0.6, co2: 18.0, terreno: 2.0, cantidad: 1.0}
    #hash_chocolate = {nombre: "chocolate", proteinas: 5.3, carbohidratos: 47.0, lipidos: 30.0, co2: 2.3, terreno: 3.4, cantidad: 1.0}
    #hash_salmon = {nombre: "salmon", proteinas: 19.9, carbohidratos: 0.0, lipidos: 13.6, co2: 6.0, terreno: 3.7, cantidad: 1.0}
    #hash_cerdo = {nombre: "cerdo", proteinas: 21.5, carbohidratos: 0.0, lipidos: 6.3, co2: 7.6, terreno: 11.0, cantidad: 1.0}
    #hash_pollo = {nombre: "pollo", proteinas: 20.6, carbohidratos: 0.0, lipidos: 5.6, co2: 5.7, terreno: 164.0, cantidad: 1.0}
    #hash_queso = {nombre: "queso", proteinas: 25.0, carbohidratos: 1.3, lipidos: 33.0, co2: 11.0, terreno: 164.0, cantidad: 1.0}
    #hash_cerveza = {nombre: "cerveza", proteinas: 0.5, carbohidratos: 3.6, lipidos: 0.0, co2: 0.24, terreno: 164.0, cantidad: 1.0}
    #hash_leche_vaca = {nombre: "leche_vaca", proteinas: 3.3, carbohidratos: 4.8, lipidos: 3.2, co2: 3.2, terreno: 164.0, cantidad: 1.0}
    #hash_huevos = {nombre: "huevos", proteinas: 13.0, carbohidratos: 1.1, lipidos: 11.0, co2: 4.2, terreno: 164.0, cantidad: 1.0}
    #hash_cafe = {nombre: "cafe", proteinas: 0.1, carbohidratos: 0.0, lipidos: 0.0, co2: 0.4, terreno: 164.0, cantidad: 1.0}
    #hash_tofu = {nombre: "tofu", proteinas: 8.0, carbohidratos: 1.9, lipidos: 4.8, co2: 2.0, terreno: 2.2, cantidad: 1.0}
    #hash_lentejas = {nombre: "lentejas", proteinas: 23.5, carbohidratos: 52.0, lipidos: 1.4, co2: 0.4, terreno: 3.4, cantidad: 1.0}
    
    @alimento_carne_vaca = Alimento.new(@hash_carne_vaca)
    alimento_cordero = Alimento.new(hash_carne_cordero)
    alimento_camarones = Alimento.new(hash_camarones)

    @nodo_vaca = Nodo.new
    @nodo_vaca.value = @alimento_carne_vaca
    @nodo_cordero = Nodo.new
    @nodo_cordero.value = alimento_cordero
    @nodo_camarones = Nodo.new
    @nodo_camarones.value = alimento_camarones

    @nodo_vaca.next = @nodo_cordero
    @nodo_cordero.prev = @nodo_vaca
    @nodo_cordero.next = @nodo_camarones
    @nodo_camarones.prev = @nodo_cordero
  end
  
  context "Pruebas para la existencia clase nodo" do
    it "Existe la clase nodo" do
      expect(Object.const_defined?('Nodo')).to be true
    end
    
    it "puedo crear un nodo almacenando un alimento" do
      expect(Nodo.new.instance_of?(Nodo)).to be true
      expect(@nodo_vaca.value).to eq(@alimento_carne_vaca)
    end
    
    it "Tiene un valor" do
      expect(@nodo_vaca.respond_to?(:value)).to be true 
    end

    it "Tiene siguiente nodo" do
      expect(@nodo_vaca.respond_to?(:next)).to be true
    end

    it "Tiene nodo anterior" do
      expect(@nodo_vaca.respond_to?(:prev)).to be true
    end

  end


  context "Prueba de los metodos de nodo" do
    it "Puedo acceder al valor de un nodo" do
      expect(@nodo_camarones.value.nombre).to eq("camarones")
    end

    it "Puedo acceder al nodo anterior" do
      expect(@nodo_cordero.prev).to eq(@nodo_vaca)
    end

    it "Puedo acceder al nodo siguiente" do
      expect(@nodo_cordero.next).to eq(@nodo_camarones)
    end


    it "Puedo acceder al nodo anterior cuando este no existe" do
      expect(@nodo_vaca.prev).to eq(nil)
    end

    it "Puedo acceder al nodo siguiente cuando este no existe" do
      expect(@nodo_camarones.next).to eq(nil)
    end

    it "nodo tiene metodo de formateo" do
      expect(@nodo_camarones.to_s).to eq("Nombre: camarones\nProteinas: 17.6g\nCarbohidratos: 1.5g\nLipidos: 0.6g\nCO2: 18.0kg\nTerreno: 2.0m2\nCantidad: 1.0kg\n")
    end
  
  end


end

