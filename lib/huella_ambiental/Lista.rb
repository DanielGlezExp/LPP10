class Lista
  include Enumerable
  attr_reader :head, :tail, :size

  def initialize
    @head, @tail, @size = nil, nil, 0
  end


  ##-------------------MÉTODOS PARA INSERTAR~~~~~~~~~~~~~~~~~~~~~~

  def insert_head valor
    nodo_aux = Nodo.new
    nodo_aux.value = valor

    if(size == 0) then
      @tail = nodo_aux
    else
      @head.prev = nodo_aux
      nodo_aux.next = @head
    end

    @head = nodo_aux 
    @size = @size + 1

  end


  def insert_tail valor
    nodo_aux = Nodo.new
    nodo_aux.value = valor

    if(size == 0) then
      @head = nodo_aux
    else
      @tail.next = nodo_aux
      nodo_aux.prev = @tail
    end
      
    @tail = nodo_aux
    @size = @size + 1

  end


  def insert_next (nodo, valor)
    raise TypeError, "el parametro nodo en insert de lista no es del tipo nodo" unless nodo.is_a?(Nodo)
    
    nodo_valor = Nodo.new
    nodo_valor.value = valor
    nodo_aux = @head

    while nodo_aux != nil do

      if nodo_aux == nodo then

        if nodo_aux.next == nil then
          insert_tail(valor)
        else
          nodo_valor.next = nodo_aux.next  #apuntamos el nuevo nodo a su correspondiente next
          nodo_aux.next.prev = nodo_valor  #le asignamos al siguiente nodo en la lista su nuevo prevv

	  nodo_valor.prev = nodo_aux
	  nodo_aux.next = nodo_valor
	  @size = @size + 1
	end

        return true

      else
        nodo_aux = nodo_aux.next
      end
    end

    return false

  end

  #~~~~~~~~~~~~~~MÉTODOS PARA ELIMINAR~~~~~~~~~~~~~~~
  def pop_head
    if (size != 0) then
      if (@head.next == nil) then
        @tail = nil
      else
        @head.next.prev = nil

      end

      aux = @head
      @head = @head.next
      aux.next = nil

      @size = @size - 1
      return true
    end

    return false
  end


  def pop_tail
    if (size != 0) then
      if (@tail.prev == nil) then
        @head = nil
      else
        @tail.prev.next=nil
      end

      aux = @tail
      @tail = @tail.prev
      aux.prev = nil
 
      @size = @size - 1
      return true
    end

    return false
  end


  def pop nodo
    raise TypeError, "En el metodo pop de lista, el argumento pasado no es un nodo" unless nodo.is_a?(Nodo)
    
    nodo_aux = @head
    while (nodo_aux != nil) do

      if(nodo_aux == nodo) then

        if (nodo_aux.next == nil) then
	  pop_head
	  return true
	end

        if (nodo_aux.prev == nil) then
          pop_head
	  return true
        end

	nodo_aux.prev.next = nodo_aux.next
	nodo_aux.next.prev = nodo_aux.prev

	nodo_aux.prev = nil
	nodo_aux.next = nil

	@size = @size - 1

	return true
      end

      nodo_aux = nodo_aux.next

    end

    return false
  end

  #Enumerable
  def each(&bloque)
    nodo_aux = @head
    while(nodo_aux != nil) do
      bloque.call(nodo_aux.value)
      
      nodo_aux = nodo_aux.next
    end
  end

  #OTROS METODOS
  def sum
    if (size == 0) then
      return false
    end
    
    valor = @head.value
    nodo_aux = @head.next
    while (nodo_aux != nil) do
      valor = valor + nodo_aux.value
      
      nodo_aux = nodo_aux.next
    end

    return valor
  end

end
