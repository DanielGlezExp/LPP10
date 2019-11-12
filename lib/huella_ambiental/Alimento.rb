class Alimento
  attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :co2, :terreno, :cantidad
  
  def initialize (*args)
    if args.length == 1 and args[0].instance_of?(Hash) then
      hash_alimento = args[0]
      inicializar(hash_alimento[:nombre], hash_alimento[:proteinas], hash_alimento[:carbohidratos], hash_alimento[:lipido], hash_alimento[:co2], hash_alimento[:terreno], hash_alimento[:cantidad] )
    elsif args.length == 7 then
      inicializar(args[0], args[1], args[2], args[3], args[4], args[5], args[6])
    end
  
  end
  
  #MÉTODOS PRIVADOS
  private

  def inicializar (nombre, proteinas, carbohidratos, lipidos, co2, terreno, cantidad)
    @nombre, @proteinas, @carbohidrados, @lipidos, @co2, @terreno, @cantidad = nombre, proteinas, carbohidratos, lipidos, co2, terreno, cantidad
  end

end
