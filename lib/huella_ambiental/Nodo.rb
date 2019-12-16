Nodo = Struct.new(:value, :next, :prev)

#Clase nodo que representa un nodo de una lista doblemente enlazada, 
#con su correspondiente indicador al siguinete y anterior nodo. 
#Asi como el valor que guarda
class Nodo

  #Metodo de formateo de la clase nodo
  def to_s
    value.to_s
  end
end
