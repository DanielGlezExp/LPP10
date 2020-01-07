class Plato

	attr_reader :alimentos, :nombre

	def initialize(nombre, &block)
		@nombre = nombre
		@alimentos = []

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

	def alimento(argumento)
		if argumento[:descripcion] and argumento[:gramos] 
			mi_hash = { descripcion: "#{argumento[:descripcion]}", gramos: "#{argumento[:gramos]}" }
			alimentos << mi_hash
	        end
	end
		
	


  #~~~~~~~~~~~~~~~~~METODOS PRIVADOS
end 
