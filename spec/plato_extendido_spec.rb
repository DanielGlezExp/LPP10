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


  end
  
  context "Pruebas para la existencia " do
    it " Existe la clase Plato extendido" do
      expect(Object.const_defined?('PlatoExtendido')).to be true
    end

  end





end

