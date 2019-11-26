require './lib/huella_ambiental'

RSpec.describe Alimento do
  before (:all) do
    @hash_carne_vaca = {nombre: "carne_vaca", proteinas: 21.1, carbohidratos: 0.0, lipidos: 3.1, co2: 50.0, terreno: 164.0, cantidad: 1.0}
    #hash_carne_cordero = {nombre: "carne_cordero", proteinas: 18.0, carbohidratos: 0.0, lipidos: 17.0, co2: 20.0, terreno: 185.0, cantidad: 1.0}
    #hash_camarones = {nombre: "camarones", proteinas: 17.6, carbohidratos: 1.5, lipidos: 0.6, co2: 18.0, terreno: 2.0, cantidad: 1.0}
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
    @hash_nuez = {nombre: "nuez", proteinas: 20.0, carbohidratos: 21.0, lipidos: 54.0, co2: 0.3, terreno: 7.9, cantidad: 1.0}

    @array_datos_comida = [@hash_carne_vaca, @hash_nuez]


    @alimento_nuez = Alimento.new(@hash_nuez)
    @alimento_carne_vaca = Alimento.new(@hash_carne_vaca)

    @array_comidas_prueba = [@alimento_nuez, @alimento_carne_vaca]
  end
  

  it "has a version number" do
    expect(HuellaAmbiental::VERSION).not_to be nil
  end

  context "Existencia de la clase Alimento y sus atributos" do
    it "La clase alimento esta definida" do
      expect(Object.const_defined?('Alimento')).to be true
    end

    it "La clase Alimento tiene un nombre para alimento" do
      expect(@alimento_nuez.respond_to?(:nombre)).to be true 
    end

    it "La clase Alimento tiene una cantidad de proteinas" do
      expect(@alimento_nuez.respond_to?(:proteinas)).to be true
    end

    it "La clase Alimento tiene una cantidad de carbohidrados" do
      expect(@alimento_nuez.respond_to?(:carbohidratos)).to be true
    end

    it "La clase Alimento tiene una cantidad de lipidos" do
      expect(@alimento_nuez.respond_to?(:lipidos)).to be true
    end

    it "La clase Alimento tiene una cantidad de gases de infecto invernadero asociada" do
      expect(@alimento_nuez.respond_to?(:co2)).to be true
    end

    it "La clase Alimento tiene una cantidad de terreno utilizado asociada" do
      expect(@alimento_nuez.respond_to?(:terreno)).to be true
    end

    it "La clase alimento tiene una cantidad de alimento en kilogramos asociada" do
      expect(@alimento_nuez.respond_to?(:cantidad)).to be true
    end

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


  context "Metodos de acceso a los datos de alimento" do
    it "Puedo acceder el anombre" do
      expect("nuez").to eq(@alimento_nuez.nombre)
    end

    it "Puedo acceder a la cantidad de proteinas" do
      expect(20.0).to eq(@alimento_nuez.proteinas)
    end

    it "Puedo acceder a la cantidad de carbohidratos" do
      expect(21.0).to eq(@alimento_nuez.carbohidratos)
    end

    it "Puedo acceder a la cantidad de Lipidos" do
      expect(54.0).to eq(@alimento_nuez.lipidos)
    end

    it "Puedo acceder a la cantidad de co2" do
      expect(0.3).to eq(@alimento_nuez.co2)
    end

    it "Puedo acceder a la cantidad de terreno" do
      expect(7.9).to eq(@alimento_nuez.terreno)
    end

    it "Puedo acceder a la cantidad de comida en kilogramos" do
      expect(1.0).to eq(@alimento_nuez.cantidad)
    end
  
  end


  context "Metodos de formateo para la clase Alimento" do
    it "La clase Alimento tiene bien hecho el metodo to_s" do
      expect("Nombre: nuez\nProteinas: 20.0g\nCarbohidratos: 21.0g\nLipidos: 54.0g\nCO2: 0.3kg\nTerreno: 7.9m2\nCantidad: 1.0kg\n").to eq(@alimento_nuez.to_s) 
    end
  end


  context "Suma de alimentos y obtencion del valor energetico" do
    it "Se puede obtener el valor energetico de un alimento" do
      expect(@alimento_nuez.valor_energetico.round(1)).to eq(650.0)
    end

    it "Se pueden sumar dos alimentos con su valor energetico" do
      expect((@alimento_nuez + @alimento_carne_vaca).valor_energetico.round(1)).to eq(762.3)
    end

    it "Se pueden sumar dos alimentos con su cantidad de co2" do
      expect((@alimento_nuez + @alimento_carne_vaca).co2.round(1)).to eq(50.3)
    end

    it "Se pueden sumar dos alimentos, comprobando cantidad de terreno" do
      expect((@alimento_nuez + @alimento_carne_vaca).terreno.round(1)).to eq(171.9)
    end
  end

  context "Multiplicacion de un alimento por un numero" do
    it "Realizar la multiplicacion" do 
      expect((@alimento_nuez * 0.5).proteinas.round(1)).to eq(10.0)
    end 
  end

  context "Puedo comparar alimentos" do
    it " ==" do
      nuez2 = Alimento.new(@hash_nuez)
      expect(@alimento_nuez == nuez2 ).to be(true)
    end

    it " == Comparando con un numero" do
      expect(@alimento_nuez == 650.0).to be(true)
    end

    it " !=" do
      expect(@alimento_nuez != @alimento_carne_vaca).to be(true)
    end

    it " <=" do
      expect(@alimento_nuez <= @alimento_carne_vaca).to be(false)
    end

    it " >=" do
      expect(@alimento_nuez >= @alimento_carne_vaca).to be(true)
    end

    it " >" do
      expect(@alimento_nuez > @alimento_carne_vaca).to be(true)
    end
    
    it " <" do
      expect(@alimento_nuez < @alimento_carne_vaca).to be(false)
    end
  end
end

