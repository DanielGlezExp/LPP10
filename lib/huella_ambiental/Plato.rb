

class Plato
  attr_reader :lista_alimentos, :cantidad_alimentos_gramos, :p_proteinas, :p_lipidos

  def initialize(lista_alimentos)
    raise TypeError, "El parametro de entrada deben ser instancias de la clase lista" unless lista_alimentos.instance_of?(Lista)
    @lista_alimentos = lista_alimentos
    inicializar_valores
  end



  #~~~~~~~~~~~~~~~~~METODOS PRIVADOS
  private
  def inicializar_valores
    @cantidad_alimentos_gramos = []
    masa_total = 0.0
    proteinas_totales = 0.0
    lipidos_totales = 0.0

    @lista_alimentos.each { |alimento|

      raise TypeError, "Todos los elementos de la lista deben ser instancias de Alimento" unless alimento.instance_of?(Alimento)
      @cantidad_alimentos_gramos << {nombre: alimento.nombre, cantidad: alimento.cantidad * 1000 }
      masa_total += alimento.cantidad * 1000
      proteinas_totales += alimento.proteinas
      lipidos_totales += alimento.lipidos

    }

    @p_proteinas = proteinas_totales / masa_total * 100.0
    @p_lipidos = lipidos_totales / masa_total * 100
  end
end
