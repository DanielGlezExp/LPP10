require './lib/huella_ambiental'

RSpec.describe Plato do
  before (:all) do
  end
  
  context "Pruebas para la existencia " do
    it " Existe la clase Plato" do
      expect(Object.const_defined?('Plato')).to be true
    end

    it "puedo crear un plato" do
      mi_plato = Plato.new("Hamburguesa") do
	alimento :descripcion => "carne de vaca",
		 :gramos => 100,
		 :co2 => 10,
		 :terreno => 30,
		 :kcal => 2
	alimento :descripcion => "huevo",
		 :gramos => 20,
		 :co2 => 2,
		 :terreno => 1,
		 :kcal => 3
      end
      expect(mi_plato.instance_of?(Plato)).to eq(true)
    end

    it "puedo mostrar un plato" do

      mi_plato = Plato.new("Hamburguesa") do
		alimento :descripcion => "carne de vaca",
			 :gramos => 100,
			 :co2 => 10,
		 	 :terreno => 30,
		 	 :kcal => 2
		alimento :descripcion => "huevo",
			 :gramos => 20,
		 	 :co2 => 2,
			 :terreno => 1,
		 	 :kcal => 3
     end
      expect(mi_plato.to_s).to eq("Nombre: Hamburguesa | C02: 12.0 | Terreno: 31.0 | Kcal: 5.0")


    end


  end


    




end

