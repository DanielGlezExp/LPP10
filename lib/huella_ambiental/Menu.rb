

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
		output = "\tMenu: #{@nombre}\nPlatos:\n"
		precio_total = 0.0
		@platos.each do |plato|
			output += plato[:plato].to_s
			output += " | Precio: #{plato[:precio]}\n"
			precio_total += plato[:precio]
		end
		output += "\tPrecio total: #{precio_total}"
		return output
	end

	def componente(argumento)
		if argumento[:plato] and argumento[:precio]
			mi_hash = { plato: argumento[:plato], precio: argumento[:precio] }
			@platos << mi_hash
		end
	end

end
