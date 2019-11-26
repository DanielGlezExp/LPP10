

class Plato
  attr_reader :lista_alimentos

  def initialize(lista_alimentos)
    raise TypeError, "El parametro de entrada deben ser instancias de la clase lista" unless lista_alimentos.instance_of?(Lista)
    @lista_alimentos = lista_alimentos
  end
end
