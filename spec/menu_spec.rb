require "./lib/huella_ambiental"

RSpec.describe Menu do
	before(:all) do
		@plato1 = Plato.new("huevo frito") do
			alimento :descripcion => "huevo",
				 :co2 => 20,
				 :terreno => 12,
				 :kcal => 28
			alimento :descripcion => "aceite",
				 :co2 => 12,
				 :terreno => 8,
				 :kcal => 45
		end

		@plato2 = Plato.new("manzana") do
			alimento :descripcion => "manzana",
				 :co2 => 3,
				 :terreno => 4,
				 :kcal => 20
		end
	end

	context "existencia" do 
		it "puedo crear un menu" do
			mi_menu = Menu.new("huevo y manzana") do
				componente :plato => @plato1,
					   :precio => 2.03
				componente :plato => @plato2,
					   :precio => 0.8
			end
		end
	end
end
