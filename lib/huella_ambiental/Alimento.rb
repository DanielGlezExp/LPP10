#Clase que representa un alimento
#Un alimento viene caracterizado por su nombre, proteinas, carbohidrados, lipidos, co2, terreno, y cantidad
class Alimento
  include Comparable
  attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :co2, :terreno, :cantidad

  #Inicializar de Aliento
  #se puede pasar un hash con los campos correspondientes a un alimento, o los campos correspondientes a un alimento seguidos uno tras otro
  def initialize (*args)
    if args.length == 1 and args[0].instance_of?(Hash) then
      hash_alimento = args[0]
      inicializar(hash_alimento[:nombre], hash_alimento[:proteinas], hash_alimento[:carbohidratos], hash_alimento[:lipidos], hash_alimento[:co2], hash_alimento[:terreno], hash_alimento[:cantidad] )
    elsif args.length == 7 then
      inicializar(args[0], args[1], args[2], args[3], args[4], args[5], args[6])
    end
  
  end

  #Formateo de Alimento
  def to_s
    return "Nombre: #{nombre}\nProteinas: #{proteinas}g\nCarbohidratos: #{carbohidratos}g\nLipidos: #{lipidos}g\nCO2: #{co2}kg\nTerreno: #{terreno}m2\nCantidad: #{cantidad}kg\n"
  end
 
  #Devuelve el valor energetico del alimento
  def valor_energetico
    return 4.0 * (proteinas + carbohidratos) + 9.0 * lipidos 
  end

  #Suma de un alimento mas otro alimento
  def + (other)
    raise TypeError, "Se espera como argumento un alimento: Alimento" unless other.is_a?(Alimento)
    cadena_y = " y "
    nuevo_nombre = nombre + cadena_y + other.nombre 
    return Alimento.new(nuevo_nombre, proteinas + other.proteinas, carbohidratos + other.carbohidratos, lipidos + other.lipidos, co2 + other.co2, terreno + other.terreno, cantidad + other.cantidad)
  end

  #multiplicación de un alimento por un escalar
  #Devuelve un alimento del mismo tipo pero diferente cantidad y por tanto carbohidratos, etc
  def * (numero)
    return Alimento.new(nombre, proteinas * numero, carbohidratos * numero, lipidos * numero, co2 * numero, terreno * numero, cantidad * numero)
  end

  #Metodo que compara un alimento con otro usando su valor energetico
  #Para ello esta clase incluye el modulo Comparable
  def <=> (other)
    if (other.is_a?(Integer) or other.is_a?(Float)) then
      return valor_energetico <=> other
    end
    raise TypeError, "Se espera como argumento un alimento, un float o un integer" unless other.is_a?(Alimento)
    #if (valor_energetico == other.valor_energetico) then
     # if (@terreno == other.terreno) then
      #  return @co2 <=> other.co2
      #end
      #return @terreno <=> other.terreno
    #end
    valor_energetico <=> other.valor_energetico
  end


  #MÉTODOS PRIVADOS
  private

  #Metodo privado para inciializar un objeto de la clase alimento
  def inicializar (nombre, proteinas, carbohidratos, lipidos, co2, terreno, cantidad)
    @nombre, @proteinas, @carbohidratos, @lipidos, @co2, @terreno, @cantidad = nombre, proteinas, carbohidratos, lipidos, co2, terreno, cantidad
  end

end
