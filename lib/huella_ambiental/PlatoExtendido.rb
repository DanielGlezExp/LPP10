#Clase platExtendido que hereda de la clase Plato
#Respoecto a la clase Plato, PlatoExtendido además tiene co2 y terreno
class PlatoExtendido < Plato
  attr_reader :co2, :terreno 

  #Inicializar un objeto de la clase PlatoExtendido
  def initialize(lista_alimentos, nombre)
    super(lista_alimentos,nombre)
    inicializar_valores_extendidos
  end

  #invalidamos el to_s superior
  
  #Metodo de formateo de la clase PlatoExtendido
  def to_s
    #resultado = "Nombre: #{@nombre}\n"
    #@cantidad_alimentos_gramos.each { |x|
    #  resultado += "#{x[:nombre]}: #{x[:cantidad].round(2)}g\n"
    #}
    resultado = super.to_s
    resultado += "co2: #{@co2.round(2)}\nterreno: #{@terreno.round(2)}\n"
    return resultado
  end

  #~~~~~~~~~~~~~~~~~METODOS PRIVADOS
  
  #Metodo auxiliar para inicializar un objeto de la clase PlatoExtendido
  private
  def inicializar_valores_extendidos
    @co2 = 0.0
    @terreno = 0.0

    @lista_alimentos.each { |alimento|
     
      @co2 += alimento.co2
      @terreno += alimento.terreno

    }

  end
end
