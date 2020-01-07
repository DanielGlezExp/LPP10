

class Menu

	def initialize(nombre, &block)
		@nombre = nombre
		@platos = []
 		
		if block_given?
			if block.arity == 1
				yield self
			else
				instance_eval(&block)
			end
		end		
		
	end

	def to_s

	end

	def componente(argumento)
		if argumento[:plato] and argumento[:precio]
			@platos << argumento
		end
	end

end
