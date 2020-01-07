class Plato

	attr_reader :alimentos, :nombre, :alimentos, :co2, :terreno, :kcal

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
		inicializar_valores
	end

	def to_s
		output = "Nombre: #{@nombre} | C02: #{@co2} | Terreno: #{@terreno} | Kcal: #{@kcal}"
		return output
	end

	def alimento(argumento)
		if argumento[:descripcion] and argumento[:co2] and argumento[:terreno] and argumento[:kcal]
			mi_hash = { descripcion: "#{argumento[:descripcion]}", co2: argumento[:co2], terreno: argumento[:terreno], kcal: argumento[:kcal]  }
			@alimentos << mi_hash
	        end
	end

		
	


  #~~~~~~~~~~~~~~~~~METODOS PRIVADO
	def inicializar_valores
		@co2 = 0.0
		@terreno = 0.0
		@kcal = 0.0
		@alimentos.each do |alimento|
			@kcal += alimento[:kcal]
			@terreno += alimento[:terreno]
			@co2 += alimento[:co2]		
		end
	end
end 
