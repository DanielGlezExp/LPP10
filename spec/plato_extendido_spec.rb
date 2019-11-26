require './lib/huella_ambiental'

RSpec.describe PlatoExtendido do
  before (:all) do
    hash_carne_vaca = {nombre: "carne_vaca", proteinas: 21.1, carbohidratos: 0.0, lipidos: 3.1, co2: 50.0, terreno: 164.0, cantidad: 1.0}
    hash_carne_cordero = {nombre: "carne_cordero", proteinas: 18.0, carbohidratos: 0.0, lipidos: 17.0, co2: 20.0, terreno: 185.0, cantidad: 1.0}
    hash_camarones = {nombre: "camarones", proteinas: 17.6, carbohidratos: 1.5, lipidos: 0.6, co2: 18.0, terreno: 2.0, cantidad: 1.0}
    hash_chocolate = {nombre: "chocolate", proteinas: 5.3, carbohidratos: 47.0, lipidos: 30.0, co2: 2.3, terreno: 3.4, cantidad: 1.0}
    #hash_salmon = {nombre: "salmon", proteinas: 19.9, carbohidratos: 0.0, lipidos: 13.6, co2: 6.0, terreno: 3.7, cantidad: 1.0}
    #hash_cerdo = {nombre: "cerdo", proteinas: 21.5, carbohidratos: 0.0, lipidos: 6.3, co2: 7.6, terreno: 11.0, cantidad: 1.0}
    #hash_pollo = {nombre: "pollo", proteinas: 20.6, carbohidratos: 0.0, lipidos: 5.6, co2: 5.7, terreno: 164.0, cantidad: 1.0}
    hash_queso = {nombre: "queso", proteinas: 25.0, carbohidratos: 1.3, lipidos: 33.0, co2: 11.0, terreno: 41.0, cantidad: 1.0}
    hash_cerveza = {nombre: "cerveza", proteinas: 0.5, carbohidratos: 3.6, lipidos: 0.0, co2: 0.24, terreno: 0.22, cantidad: 1.0}
    hash_leche_vaca = {nombre: "leche_vaca", proteinas: 3.3, carbohidratos: 4.8, lipidos: 3.2, co2: 3.2, terreno: 8.9, cantidad: 1.0}
    hash_huevos = {nombre: "huevos", proteinas: 13.0, carbohidratos: 1.1, lipidos: 11.0, co2: 4.2, terreno: 5.7, cantidad: 1.0}
    hash_cafe = {nombre: "cafe", proteinas: 0.1, carbohidratos: 0.0, lipidos: 0.0, co2: 0.4, terreno: 0.4, cantidad: 1.0}
    hash_tofu = {nombre: "tofu", proteinas: 8.0, carbohidratos: 1.9, lipidos: 4.8, co2: 2.0, terreno: 2.2, cantidad: 1.0}
    hash_lentejas = {nombre: "lentejas", proteinas: 23.5, carbohidratos: 52.0, lipidos: 1.4, co2: 0.4, terreno: 3.4, cantidad: 1.0}
    #hash_nuez = {nombre: "nuez", proteinas: 20.0, carbohidrados: 21.0, lipidos: 54.0, co2: 0.4, terreno: 7.9, cantidad: 1.0}
    
    alimento_carne_vaca = Alimento.new(hash_carne_vaca)
    alimento_cordero = Alimento.new(hash_carne_cordero)
    alimento_camarones = Alimento.new(hash_camarones)
    alimento_chocolate = Alimento.new(hash_chocolate)
    alimento_queso = Alimento.new (hash_queso)
    alimento_cerveza = Alimento.new(hash_cerveza)
    alimento_leche = Alimento.new(hash_leche_vaca)
    alimento_huevos = Alimento.new(hash_huevos)
    alimento_cafe = Alimento.new(hash_cafe)
    alimento_tofu = Alimento.new(hash_tofu)
    alimento_lentejas = Alimento.new(hash_lentejas)
    #alimento_nuez = Alimento.new(hash_nuez) 

    #~~~~~~LISTAS DE DIETAS
    #ESPAÑOLA
    lista_espanola = Lista.new
    lista_espanola.insert_head(alimento_camarones)
    lista_espanola.insert_head(alimento_chocolate)
    lista_espanola.insert_head(alimento_cerveza)
    lista_espanola.insert_head(alimento_queso)

    #VASCA
    lista_vasca = Lista.new
    lista_vasca.insert_head(alimento_chocolate)
    lista_vasca.insert_head(alimento_lentejas)
    lista_vasca.insert_head(alimento_huevos)

    #vegetaria
    lista_vegetaria = Lista.new
    lista_vegetaria.insert_head(alimento_leche)

    lista_vegetaria.insert_head(alimento_huevos)
    lista_vegetaria.insert_head(alimento_lentejas)

    #vegetaliana
    lista_vegetaliana = Lista.new
    lista_vegetaliana.insert_head(alimento_cafe)
    lista_vegetaliana.insert_head(alimento_tofu)

    #locura por la carne
    @lista_carne = Lista.new
    @lista_carne.insert_head(alimento_carne_vaca)
    @lista_carne.insert_head(alimento_cordero)
    @lista_carne.insert_head(alimento_lentejas)
    @lista_carne.insert_head(alimento_huevos)



   #PLATO
   @plato_espanol = Plato.new(lista_espanola, "ole ole")
   @plato_vasco = Plato.new(lista_vasca, "asociacion de alimentos independientes")
   @plato_vegetaliana = Plato.new(lista_vegetaliana, "transcendencia")
   @plato_extendido_carne = PlatoExtendido.new(@lista_carne, "canibal con lentejas")
   @plato_extendido_vegetaria = PlatoExtendido.new(lista_vegetaria, "El punto medio a la matanza")
   @plato_carne = Plato.new(@lista_carne, "canibal con lentejas sin preocupaciones")


   #Lista de platos
   @lista_platos = Lista.new
   @lista_platos.insert_head @plato_vasco
   @lista_platos.insert_head @plato_extendido_carne
   @lista_platos.insert_head @plato_extendido_vegetaria
   @lista_platos.insert_head @plato_espanol
   @lista_platos.insert_head @plato_vegetaliana

  end
  
  context "Pruebas para la existencia " do
    it " Existe la clase Plato extendido" do
      expect(Object.const_defined?('PlatoExtendido')).to be true
    end

    it " Puedo instanciar un objeto de la clase PlatoExtendido 1/3" do
      expect(PlatoExtendido.new(@lista_carne, "canibal con lentejas").is_a?(Plato)).to be(true)
    end

    it "puedo instanciar un objeto de la clase PlatoExtendido 2/3" do
      expect(PlatoExtendido.new(@lista_carne, "canibal con lentejas").instance_of?(PlatoExtendido)).to be(true)
    end

    it "Puedo instanciar un objeto de la clase PlatoExtendido 3/3" do
      expect(PlatoExtendido.new(@lista_carne, "canibal con lentejas").class).to be(PlatoExtendido)
    end

    it "Existe un nombre para platoExtendido" do
      expect(PlatoExtendido.new(@lista_carne, "canibal con lentejas").nombre).to eq("canibal con lentejas")
    end

    it " Existe conjunto de alimentos" do
      expect(@plato_extendido_carne.respond_to?(:lista_alimentos)).to be(true)
    end

    it " Existe la cantidad de alimentos en gramos" do
      expect(@plato_extendido_carne.respond_to?(:cantidad_alimentos_gramos)).to be(true)
    end
  end


  context "  Metodos de acceso a los datos " do

    it " Calcula bien el portentaje de proteinas" do
      expect(@plato_extendido_carne.p_proteinas.round(2)).to eq(46.9)
    end

    it " Calculo bien el porcentaje de lipidos" do
      expect(@plato_extendido_carne.p_lipidos.round(2)).to eq(20.16)
    end

    it " Calcula bien el porcentaje de glucidos" do
      expect(@plato_extendido_carne.p_carbohidratos.round(2)).to eq(32.94)
    end

    it " valor calorico del plato" do	
      expect(@plato_extendido_carne.v_calorico.round(2)).to eq(807.3)    
    end

    it " valor de co2" do
      expect(@plato_extendido_vegetaria.co2.round(2)).to eq(7.8)
    end

    it " valor terreno" do
      expect(@plato_extendido_vegetaria.terreno.round(2)).to eq(18.0)
    end
  end

  
  context " Formateo de la clase" do
    it " Formateo clase plato" do 
      expect(@plato_extendido_vegetaria.to_s).to eq("Nombre: El punto medio a la matanza\nlentejas: 1000.0g\nhuevos: 1000.0g\nleche_vaca: 1000.0g\nco2: 7.8\nterreno: 18.0\n")
    end
    
  end

  
  context "Comparacion de platos" do
    it " ==" do
      expect(@plato_extendido_carne == @plato_carne).to be(true)
    end

    it "!=" do
      expect(@plato_carne != @plato_extendido_vegetaria).to be(true)
    end

    it " <=" do
      expect(@plato_extendido_carne <= @plato_extendido_vegetaria).to be(false)
    end

    
    it " <" do
      expect(@plato_extendido_carne < @plato_extendido_vegetaria).to be(false)
    end


    it " =>" do
      expect(@plato_extendido_carne >= @plato_extendido_vegetaria).to be(true)
    end


    it " >" do
      expect(@plato_extendido_carne > @plato_extendido_vegetaria).to be(true)
    end

  end

  context " Listas de platos" do
    it " collect" do
      r = @lista_platos.collect { |x| x}
      expect(r).to eq([@plato_vegetaliana, @plato_espanol, @plato_extendido_vegetaria, @plato_extendido_carne, @plato_vasco])
    end

    it " select" do
      r = @lista_platos.select { |x| x > @plato_extendido_carne }
      expect(r).to eq([@plato_espanol, @plato_vasco])
    end

    it " max" do
      expect(@lista_platos.max).to eq(@plato_espanol)
    end

    it " min" do
      expect(@lista_platos.min).to eq(@plato_vegetaliana)
    end

    it " sort" do
      r = @lista_platos.sort
      expect(r).to eq([@plato_vegetaliana, @plato_extendido_vegetaria, @plato_extendido_carne, @plato_vasco, @plato_espanol])
    end

  end


end

