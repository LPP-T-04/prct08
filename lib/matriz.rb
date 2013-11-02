class Matriz
	attr_accessor :filas, :columnas, :elemento

	def initialize(filas, columnas, elemento)
		@filas = filas
		@columnas = columnas
		@elemento = Array.new(elemento)
	end
end	