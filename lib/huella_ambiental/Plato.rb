

class Plato
  attr_reader :lista_alimentos, :cantidad_alimentos_gramos, :p_proteinas, :p_lipidos, :p_carbohidratos, :v_calorico

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
    carbohidratos_totales = 0.0
    @v_calorico= 0.0

    @lista_alimentos.each { |alimento|

      raise TypeError, "Todos los elementos de la lista deben ser instancias de Alimento" unless alimento.instance_of?(Alimento)
      @cantidad_alimentos_gramos << {nombre: alimento.nombre, cantidad: alimento.cantidad * 1000 }
      #masa_total += alimento.cantidad * 1000
      masa_total += alimento.proteinas + alimento.lipidos + alimento.carbohidratos
      proteinas_totales += alimento.proteinas
      lipidos_totales += alimento.lipidos
      carbohidratos_totales += alimento.carbohidratos
      @v_calorico += alimento.valor_energetico

    }

    @p_proteinas = proteinas_totales / masa_total * 100.0
    @p_lipidos = lipidos_totales / masa_total * 100.0
    @p_carbohidratos = carbohidratos_totales / masa_total * 100.0
  end
end
