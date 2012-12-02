# File: matriz.rb

require 'fraccion'

class Matriz

	attr_reader :fil, :col

	def initialize (*args) # números de argumentos variables *
		raise IndexError unless ((args[0] > 0) && (args[1] > 0)) # Error, si dimensión <0
		@fil = args[0]
		@col = args[1]
		@datos = Array.new(@fil) {Array.new(@col) {0}} if (args.size == 2) # Datos inicializados a 0
		@datos = Array.new(@fil) {Array.new(@col) {args[2]}} if (args.size == 3) # Datos inicializados al 3 argumento
		if (args.size > 3)
			tam = @fil * @col # Número de elementos, tam
			raise IndexError unless (args.size == tam + 2) # Si hay tantos elementos para llenar la matriz
			@datos = Array.new(@fil) {Array.new(@col) {0}}
			for i in (0...self.fil)
				for j in (0...self.col)
					@datos[i][j] = args[i*@col+j+2]
				end
			end 
		end # if
	end

	def to_s
		cadena = "\tMatriz (#{self.fil}, #{self.col})\n"
		for i in (0...self.fil)
				cadena << "\t | "
			for j in (0...self.col)
				cadena << "#{@datos[i][j]} "
			end
				cadena << "|\n"
		end
		cadena
	end


end

#M = Matriz.new(2, 3, 0)
#puts M
#N = Matriz.new(2, 3, 1, 2, 3, 4, 5, 6)
#puts N