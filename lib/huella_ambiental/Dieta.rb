class Dieta

  def initialize (array)
    raise TypeError, "se espera como argumento un array: Array" unless array.is_a?(Array)
    @super_alimento = array[0]
    @conjunto_alimentos = array
    array.drop(1).each do |x|
      raise TypeError, "Los argumentos del Array deben ser Alimentos" unless x.is_a?(Alimento)
      @super_alimento = @super_alimento + x
    end
  end

  def to_s
    cadena = ""
    @conjunto_alimentos.each do |x|
      cadena = cadena + x.nombre + " " + x.cantidad.round(1).to_s + "kg\n"
    end
    return cadena
  end

  def impacto_ambiental
    return [@super_alimento.co2.round(1), @super_alimento.terreno.round(1)]
  end

  def proteinas
    return @super_alimento.proteinas
  end

  def carbohidratos
    return @super_alimento.carbohidratos
  end

  def lipidos
    return @super_alimento.lipidos
  end

  def valor_energetico
    return @super_alimento.valor_energetico
  end

  def co2
    return @super_alimento.co2
  end

  def cantidad
    return @super_alimento.cantidad
  end

  def terreno
    return @super_alimento.terreno
  end
end
