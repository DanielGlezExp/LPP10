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
			
			plato1 = Plato.new("huevo frito") do
				alimento :descripcion => "huevo",
					 :co2 => 20,
					 :terreno => 12,
					 :kcal => 28
				alimento :descripcion => "aceite",
					 :co2 => 12,
				 	:terreno => 8,
				 	:kcal => 45
			end

			plato2 = Plato.new("manzana") do
				alimento :descripcion => "manzana",
					 :co2 => 3,
					 :terreno => 4,
					 :kcal => 20
			end
			mi_menu = Menu.new("huevo y manzana") do
				componente :plato => plato1,
					   :precio => 2.03
				componente :plato => plato2,
					   :precio => 0.8
			end
		end
	end

	context "formateo" do
		it "puedo mostrar el menu formateado" do

			plato1 = Plato.new("huevo frito") do
				alimento :descripcion => "huevo",
					 :co2 => 20,
					 :terreno => 12,
					 :kcal => 28
				alimento :descripcion => "aceite",
					 :co2 => 12,
					 :terreno => 8,
					 :kcal => 45
			end
	
			plato2 = Plato.new("manzana") do
				alimento :descripcion => "manzana",
					 :co2 => 3,
					 :terreno => 4,
					 :kcal => 20
			end
			mi_menu = Menu.new("huevo y manzana") do
				componente :plato => plato1,
					   :precio => 2.03
				componente :plato => plato2,
					   :precio => 0.8
			end
			expect(mi_menu.to_s).to eq("\tMenu: huevo y manzana\nPlatos:\nNombre: huevo frito | C02: 32.0 | Terreno: 20.0 | Kcal: 73.0 | Precio: 2.03\nNombre: manzana | C02: 3.0 | Terreno: 4.0 | Kcal: 20.0 | Precio: 0.8\n\tPrecio total: 2.83")
		end
	end
end
