# File: matriz.rb

require 'fraccion'

class Matriz

	attr_reader :fil, :col

	def initialize (*args) # números de argumentos variables *
		raise IndexError unless ((args[0] > 0) && (args[1] > 0)) # Error, si dimensión <0
		@fil = args[0]
		@col = args[1]
		@datos = Array.new(@fil, Array.new(@col, 0)) if (args.size == 2) # Datos inicializados a 0
		@datos = Array.new(@fil, Array.new(@col, args[2])) if (args.size == 3) # Datos inicializados al 3 argumento
		if (args.size > 3)
			tam = @fil * @col # Número de elementos, tam
			raise IndexError unless (args.size == tam + 2) # Si hay tantos elementos para llenar la matriz
			@datos = Array.new(@fil, Array.new(@col, 0))
			for i in (0...self.fil)
				for j in (0...self.col)
					self[i][j] = args[i*@col+j+2]
				end
			end 
		end # if
	end

	def to_s
		cadena = "\tMatriz (#{self.fil}, #{self.col})\n"
		for i in (0...self.fil)
				cadena << "\t | "
			for j in (0...self.col)
				cadena << "#{self[i][j]} "
			end
				cadena << "|\n"
		end
		return cadena
	end

	def [] (i) # Para facilitar el acceso, así no tendré que poner siempre self.datos[i][j] sino self[i][j]
		@datos[i]
	end

	def == (m) # 
		raise IndexError unless ((self.fil == m.fil) && (self.col == m.col))
		igual = true
		for i in (0...self.fil)
			for j in (0...self.col)
				igual = false if (self[i][j] != m[i][j])
			end
		end 		
		return igual
	end

	def + (m)
		raise IndexError unless ((self.fil == m.fil) && (self.col == m.col))
		suma = Matriz.new(self.fil, self.col)
		for i in (0...self.fil)
			for j in (0...self.col)
				suma[i][j] = self[i][j] + m[i][j]
			end
		end  
		return suma		
	end


end
