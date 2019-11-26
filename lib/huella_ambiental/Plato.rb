

class Plato
  attr_reader :lista_alimentos, :cantidad_alimentos_gramos

  def initialize(lista_alimentos)
    raise TypeError, "El parametro de entrada deben ser instancias de la clase lista" unless lista_alimentos.instance_of?(Lista)
    @lista_alimentos = lista_alimentos
    inicializar_valores
  end



  #~~~~~~~~~~~~~~~~~METODOS PRIVADOS
  private
  def inicializar_valores
    @cantidad_alimentos_gramos = []
    @lista_alimentos.each { |alimento|
      raise TypeError, "Todos los elementos de la lista deben ser instancias de Alimento" unless alimento.instance_of?(Alimento)
      @cantidad_alimentos_gramos << {nombre: alimento.nombre, cantidad: alimento.cantidad * 1000 }
    }
  end
end
