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
  

  context "Existencia de la clase Alimento y sus atributos" do
    it "La clase alimento esta definida" do
      expect(Object.const_defined?('Alimento')).to be true
    end

    it "La clase Alimento tiene un nombre para alimento" do
      expect(@hash_alimentos[:nuez].respond_to?(:nombre)).to be true 
    end

    it "La clase Alimento tiene una cantidad de proteinas" do
      expect(@hash_alimentos[:nuez].respond_to?(:proteinas)).to be true
    end

    it "La clase Alimento tiene una cantidad de carbohidrados" do
      expect(@hash_alimentos[:nuez].respond_to?(:carbohidratos)).to be true
    end

    it "La clase Alimento tiene una cantidad de lipidos" do
      expect(@hash_alimentos[:nuez].respond_to?(:lipidos)).to be true
    end

    it "La clase Alimento tiene una cantidad de gases de infecto invernadero asociada" do
      expect(@hash_alimentos[:nuez].respond_to?(:co2)).to be true
    end

    it "La clase Alimento tiene una cantidad de terreno utilizado asociada" do
      expect(@hash_alimentos[:carne_vaca].respond_to?(:terreno)).to be true
    end

    it "La clase alimento tiene una cantidad de alimento en kilogramos asociada" do
      expect(@hash_alimentos[:carne_vaca].respond_to?(:cantidad)).to be true
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
      expect("nuez").to eq(@hash_alimentos[:nuez].nombre)
    end

    it "Puedo acceder a la cantidad de proteinas" do
      expect(20.0).to eq(@hash_alimentos[:nuez].proteinas)
    end

    it "Puedo acceder a la cantidad de carbohidratos" do
      expect(21.0).to eq(@hash_alimentos[:nuez].carbohidratos)
    end

    it "Puedo acceder a la cantidad de Lipidos" do
      expect(54.0).to eq(@hash_alimentos[:nuez].lipidos)
    end

    it "Puedo acceder a la cantidad de co2" do
      expect(0.3).to eq(@hash_alimentos[:nuez].co2)
    end

    it "Puedo acceder a la cantidad de terreno" do
      expect(7.9).to eq(@hash_alimentos[:nuez].terreno)
    end

    it "Puedo acceder a la cantidad de comida en kilogramos" do
      expect(1.0).to eq(@hash_alimentos[:nuez].cantidad)
    end
  
  end

end
