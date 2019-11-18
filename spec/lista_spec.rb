require './lib/huella_ambiental'

RSpec.describe Lista do
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
    @alimento_cordero = Alimento.new(hash_carne_cordero)
    @alimento_camarones = Alimento.new(hash_camarones)

    

    @lista = Lista.new

  end
  
  context "Pruebas para la existencia clase Lista" do
    it "Existe la clase lista" do
      expect(Object.const_defined?('Lista')).to be true
    end
    
    it "puedo crear una lista" do
      expect(Nodo.new(@alimento_carne_vaca).instance_of?(Nodo)).to be true
    end
    
    it "Existe la cabeza de la lista" do
      expect(@nodo_vaca.respond_to?(:value)).to be true 
    end

    it "Existe la cola de la lista" do
      expect(@nodo_vaca.respond_to?(:next)).to be true
    end

    it "Existe el tamanio de la lista" do
      expect(@nodo_vaca.respond_to?(:prev)).to be true
    end

  end


  context "Prueba de los metodos de Lista" do
    it "Puedo insertar un unico elemento por la cabeza" do
      mi_lista = Lista.new
      mi_lista.insert_head(@alimento_camarones)
      expect(mi_lista.head.value.name).to eq("camarones")
      expect(mi_lista.head).to eq(mi_lista.tail)
      expect(mi_lista.size).to eq(1)
    end

    it "Puedo insertar un unico elemento en la cola" do
      mi_lista = Lista.new
      mi_lista.insert_tail(@alimento_camarones)
      expect(mi_lista.tail.value.name).to eq("camarones")
      expect(mi_lista.head).to eq(mi_lista.tail)
      expect(mi_lista.size).to eq(1)
    end

    it "Puedo insertar varios elementos en la lista" do
      @lista.insert_tail(@alimento_carne_vaca)
      @lista.insert_tail(@alimento_camarones)
      expect(@lista.head.value).to eq(@alimento_carne_vaca)
      expect(@lista.tail.value).to eq(@alimento_camarones)
      expect(@lista.size).to eq(2)
    end

    it "Dado un nodo, si esta en al lista, insertar un nuevo elemento tras dicho nodo (si no esta en la lista, no hace nada)" do
      @lista.insert_next(@lista.head, @alimento_cordero)
      expect(@lista.head.next).to eq(@alimento_cordero)
      expect(@lista.size).to eq(3)
    end

    it "Puedo eliminar la cabeza" do
      @lista.pop_head
      expect(@lista.head.value).to eq(@alimento_cordero)
      expect(@lista.size).to eq(2)
    end

    it "Puedo eliminar la cola" do
      @lista.pop_tail
      expect(@lista.tail.value).to eq(@alimento_cordero)
      expect(@lista.size).to eq(1)
    end

    it "Puedo eliminar un nodo, si esta en la lista" do
      @lista.pop(@lista.head)
      expect(@lista.head).to eq(nil)
      expect(@lista.tail).to eq(nil)
      expect(@lista.size).to eq(0)
    end

  end


end

