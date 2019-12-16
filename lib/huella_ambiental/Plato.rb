
#Clae Plato representa un conjunto de alimentos
class Plato
  include Comparable

  attr_reader :lista_alimentos, :cantidad_alimentos_gramos, :p_proteinas, :p_lipidos, :p_carbohidratos, :v_calorico, :huella_nutricional, :nombre

  #A partir de una lista de alimentos y un nombre, crea un objeto de la clase Plato
  def initialize(lista_alimentos, nombre)
    raise TypeError, "El primer parametro de entrada deben ser instancias de la clase lista" unless lista_alimentos.instance_of?(Lista)
    raise TypeError, "El segundo parametro de entrada debe ser un string" unless nombre.instance_of?(String)
    @nombre = nombre
    @lista_alimentos = lista_alimentos
    inicializar_valores
  end

  #Metodo de formateo de la clase plato
  def to_s
    resultado = "Nombre: #{@nombre}\n"
    @cantidad_alimentos_gramos.each { |x|
      resultado += "#{x[:nombre]}: #{x[:cantidad].round(2)}g\n"
    }
    return resultado
  end

  #Metodo para comprar dos platos dado sus huellas nutricionales
  #Este método será usado por el módulo Comparable
  def <=> (other)
    if (other.is_a?(Integer) or other.is_a?(Float)) then
      return @v_calorico <=> other
    end
    raise TypeError, "El parametro para comparar con plato debe ser una instancia de plato o clases derivadas, o un entero o flotante" unless other.is_a?(Plato)

    @huella_nutricional <=> other.huella_nutricional
  end

  #~~~~~~~~~~~~~~~~~METODOS PRIVADOS
  
  #Netodo auxiliar para inicializar los valres del plato
  private
  def inicializar_valores
    @cantidad_alimentos_gramos = []
    masa_total = 0.0
    proteinas_totales = 0.0
    lipidos_totales = 0.0
    carbohidratos_totales = 0.0
    co2 = 0.0
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
      co2 += alimento.co2
    }

    @p_proteinas = proteinas_totales / masa_total * 100.0
    @p_lipidos = lipidos_totales / masa_total * 100.0
    @p_carbohidratos = carbohidratos_totales / masa_total * 100.0


    #Calculo de la huella nutricional
    valor1 = 0
    valor2 = 0
    if @v_calorico < 670 then
      valor1 = 1
    elsif @v_calorico <=830 then
      valor1 = 2
    else
      valor2 = 3
    end

    
    if co2 < 800 then
      valor2 = 1
    elsif co2 <=1200 then
      valor2 = 2
    else
      valor2 = 3
    end

    @huella_nutricional = (valor1 + valor2)/2.0

  end
end 
