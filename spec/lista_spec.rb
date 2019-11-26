require './lib/huella_ambiental'

RSpec.describe Lista do
  before (:all) do
    @hash_carne_vaca = {nombre: "carne_vaca", proteinas: 21.1, carbohidratos: 0.0, lipidos: 3.1, co2: 50.0, terreno: 164.0, cantidad: 1.0}
    hash_carne_cordero = {nombre: "carne_cordero", proteinas: 18.0, carbohidratos: 0.0, lipidos: 17.0, co2: 20.0, terreno: 185.0, cantidad: 1.0}
    hash_camarones = {nombre: "camarones", proteinas: 17.6, carbohidratos: 1.5, lipidos: 0.6, co2: 18.0, terreno: 2.0, cantidad: 1.0}
    hash_chocolate = {nombre: "chocolate", proteinas: 5.3, carbohidratos: 47.0, lipidos: 30.0, co2: 2.3, terreno: 3.4, cantidad: 1.0}
    #hash_salmon = {nombre: "salmon", proteinas: 19.9, carbohidratos: 0.0, lipidos: 13.6, co2: 6.0, terreno: 3.7, cantidad: 1.0}
    #hash_cerdo = {nombre: "cerdo", proteinas: 21.5, carbohidratos: 0.0, lipidos: 6.3, co2: 7.6, terreno: 11.0, cantidad: 1.0}
    #hash_pollo = {nombre: "pollo", proteinas: 20.6, carbohidratos: 0.0, lipidos: 5.6, co2: 5.7, terreno: 164.0, cantidad: 1.0}
    hash_queso = {nombre: "queso", proteinas: 25.0, carbohidratos: 1.3, lipidos: 33.0, co2: 11.0, terreno: 164.0, cantidad: 1.0}
    hash_cerveza = {nombre: "cerveza", proteinas: 0.5, carbohidratos: 3.6, lipidos: 0.0, co2: 0.24, terreno: 164.0, cantidad: 1.0}
    hash_leche_vaca = {nombre: "leche_vaca", proteinas: 3.3, carbohidratos: 4.8, lipidos: 3.2, co2: 3.2, terreno: 164.0, cantidad: 1.0}
    hash_huevos = {nombre: "huevos", proteinas: 13.0, carbohidratos: 1.1, lipidos: 11.0, co2: 4.2, terreno: 164.0, cantidad: 1.0}
    hash_cafe = {nombre: "cafe", proteinas: 0.1, carbohidratos: 0.0, lipidos: 0.0, co2: 0.4, terreno: 164.0, cantidad: 1.0}
    hash_tofu = {nombre: "tofu", proteinas: 8.0, carbohidratos: 1.9, lipidos: 4.8, co2: 2.0, terreno: 2.2, cantidad: 1.0}
    hash_lentejas = {nombre: "lentejas", proteinas: 23.5, carbohidratos: 52.0, lipidos: 1.4, co2: 0.4, terreno: 3.4, cantidad: 1.0}
    #hash_nuez = {nombre: "nuez", proteinas: 20.0, carbohidrados: 21.0, lipidos: 54.0, co2: 0.4, terreno: 7.9, cantidad: 1.0}
    
    @alimento_carne_vaca = Alimento.new(@hash_carne_vaca)
    @alimento_cordero = Alimento.new(hash_carne_cordero)
    @alimento_camarones = Alimento.new(hash_camarones)
    alimento_chocolate = Alimento.new(hash_chocolate)
    alimento_queso = Alimento.new (hash_queso)
    alimento_cerveza = Alimento.new(hash_cerveza)
    alimento_leche = Alimento.new(hash_leche_vaca)
    alimento_huevos = Alimento.new(hash_huevos)
    @alimento_cafe = Alimento.new(hash_cafe)
    @alimento_tofu = Alimento.new(hash_tofu)
    alimento_lentejas = Alimento.new(hash_lentejas)
    #alimento_nuez = Alimento.new(hash_nuez) 

    @lista = Lista.new

    #~~~~~~LISTAS DE DIETAS
    #ESPAÑOLA
    espanola = Lista.new
    espanola.insert_head(@alimento_camarones)
    espanola.insert_head(alimento_chocolate)
    espanola.insert_head(alimento_cerveza)
    espanola.insert_head(alimento_queso)
    @dieta_espanola = espanola.sum

    #VASCA
    vasca = Lista.new
    vasca.insert_head(alimento_chocolate)
    vasca.insert_head(alimento_lentejas)
    vasca.insert_head(alimento_huevos)
    @dieta_vasca = vasca.sum

    #vegetaria
    vegetaria = Lista.new
    vegetaria.insert_head(alimento_leche)

    vegetaria.insert_head(alimento_huevos)
    vegetaria.insert_head(alimento_lentejas)
    @dieta_vegetaria = vegetaria.sum

    #vegetaliana
    @lista_vegetaliana = Lista.new
    @lista_vegetaliana.insert_head(@alimento_cafe)
    @lista_vegetaliana.insert_head(@alimento_tofu)
    @dieta_vegetaliana = @lista_vegetaliana.sum

    #locura por la carne
    lista_carne = Lista.new
    lista_carne.insert_head(@alimento_carne_vaca)
    lista_carne.insert_head(@alimento_cordero)
    lista_carne.insert_head(alimento_lentejas)
    lista_carne.insert_head(alimento_huevos)
    @dieta_carne = lista_carne.sum


  end
  
  context "Pruebas para la existencia " do
    it "Existe la clase lista" do
      expect(Object.const_defined?('Lista')).to be true
    end
    
    it "puedo crear una lista" do
      expect(@lista.instance_of?(Lista)).to be true
    end
    
    it "Existe la cabeza de la lista" do
      expect(@lista.respond_to?(:head)).to be true 
    end

    it "Existe la cola de la lista" do
      expect(@lista.respond_to?(:tail)).to be true
    end

    it "Existe el tamanio de la lista" do
      expect(@lista.respond_to?(:size)).to be true
    end

  end


  context "Prueba insercion " do
    it "Puedo insertar un unico elemento por la cabeza" do
      mi_lista = Lista.new
      mi_lista.insert_head(1)
      expect(mi_lista.head.value).to eq(1)
      expect(mi_lista.head).to eq(mi_lista.tail)
      expect(mi_lista.size).to eq(1)
    end

    it "Puedo insertar un unico elemento en la cola" do
      mi_lista = Lista.new
      mi_lista.insert_tail(@alimento_camarones)
      expect(mi_lista.tail.value.nombre).to eq("camarones")
      expect(mi_lista.head).to eq(mi_lista.tail)
      expect(mi_lista.size).to eq(1)
    end

    it "Puedo insertar varios elementos en la lista parte 1" do
      @lista.insert_head(@alimento_carne_vaca)  # CARNE_VACA -> NIL
      @lista.insert_tail(@alimento_camarones)  # CARNE_VACA -> CAMARONES
      expect(@lista.head.value.nombre).to eq("carne_vaca")
    end

    it "Puedo insertar varios elementos en la lista parte 2" do
      expect(@lista.tail.value.nombre).to eq(@alimento_camarones.nombre)
    end

    it "Puedo insertar varios elementos en la lista parte 3" do
      expect(@lista.size).to eq(2)
    end

    it "Dado un nodo, si esta en la lista, insertar un nuevo elemento tras dicho nodo (si no esta en la lista, no hace nada) 1/3" do
      @lista.insert_next(@lista.head, @alimento_cordero)  #CARNE_VACA -> CARNE_CORDERO -> CAMARONES
      expect(@lista.head.next.value.nombre).to eq(@alimento_cordero.nombre)
    end

    it "Dado un nodo, si esta en la lista, insertar un nuevo elemento tras dicho nodo (si no esta en la lista, no hace nada) 2/3" do
      expect(@lista.tail.value.nombre).to eq(@alimento_camarones.nombre)
    end

    it "Dado un nodo, si esta en la lista, insertar un nuevo elemento tras dicho nodo (si no esta en la lista, no hace nada) 3/3" do
      expect(@lista.size).to eq(3)
    end
  end


  context "Pruebas eliminar " do

    it "Puedo eliminar la cabeza 1/2" do
      @lista.pop_head  # CARNE_CORDERO -> CAMARONES
      expect(@lista.head.value.nombre).to eq(@alimento_cordero.nombre)
    end

    it "Puedo eliminar la cabeza 2/2" do
      expect(@lista.size).to eq(2)
    end

    it "Puedo eliminar la cola 1/2" do
      @lista.pop_tail  # CARNE_CORDERO -> NIL
      expect(@lista.tail.value.nombre).to eq(@alimento_cordero.nombre)
    end

    it "Puedo eliminar la cola 2/2" do
      expect(@lista.size).to eq(1)
    end

    it "Puedo eliminar un nodo, si esta en la listai 1/3" do
      @lista.pop(@lista.head) #NIL
      expect(@lista.head).to eq(nil)
    end

    it "Puedo eliminar un nodo, si esta en la lista 2/3" do
      expect(@lista.tail).to eq(nil)
    end

    it "Puedo eliminar un nodo, si esta en la lista 3/3" do
      expect(@lista.size).to eq(0)
    end

  end

  
  context "Preubas dietas co2 ANUALES " do
    it " espanola" do
      expect(@dieta_espanola.co2.round(2)).to eq(31.54)
    end
    
    it " vasca" do
      expect(@dieta_vasca.co2.round(2)).to eq(6.9)
    end

    it " vegetaria" do
      expect(@dieta_vegetaria.co2.round(2)).to eq(7.8)
    end

    it " vegetaliana" do
      expect(@dieta_vegetaliana.co2.round(2)).to eq(2.4)
    end

    it " locura carne" do
      expect(@dieta_carne.co2.round(2)).to eq(74.6)
    end
  end


  context "Preubas dietas co2 DIARIAS " do
    it " espanola" do
      expect((@dieta_espanola.co2/365).round(4)).to eq((31.54/365).round(4))
    end
    
    it " vasca" do
      expect((@dieta_vasca.co2/365).round(4)).to eq((6.9/365).round(4))
    end

    it " vegetaria" do
      expect((@dieta_vegetaria.co2/365).round(4)).to eq((7.8/365).round(4))
    end

    it " vegetaliana" do
      expect((@dieta_vegetaliana.co2/365).round(4)).to eq((2.4/365).round(4))
    end

    it " locura carne" do
      expect((@dieta_carne.co2/365).round(4)).to eq((74.6/365).round(4))
    end
  end
  

  context "Preubas dietas terreno ANUALES " do
    it " espanola" do
      expect(@dieta_espanola.terreno.round(2)).to eq(333.4)
    end
    
    it " vasca" do
      expect(@dieta_vasca.terreno.round(2)).to eq(170.8)
    end

    it " vegetaria" do
      expect(@dieta_vegetaria.terreno.round(2)).to eq(331.4)
    end

    it " vegetaliana" do
      expect(@dieta_vegetaliana.terreno.round(2)).to eq(166.2)
    end

    it " locura carne" do
      expect(@dieta_carne.terreno.round(2)).to eq(516.4)
    end
  end


  #------------------------------PRACTICA 8 ------------------------
  context "prueba enummerable " do
    it " collect" do
      r = @lista_vegetaliana.collect { |x| x }
      expect(r).to eq([@alimento_tofu, @alimento_cafe])
    end

    it " select" do
      r = @lista_vegetaliana.select { |x| x > @alimento_tofu }
      expect(r).to eq([])
    end

    it " max" do
      expect(@lista_vegetaliana.max).to eq(@alimento_tofu)
    end

    it " min" do
      expect(@lista_vegetaliana.min).to eq(@alimento_cafe)
    end

    it " sort" do
      r = @lista_vegetaliana.sort
      expect(r).to eq([@alimento_cafe, @alimento_tofu])
    end
    
  end

end

