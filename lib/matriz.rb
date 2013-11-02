class Matriz
	attr_accessor :filas, :columnas, :elemento

	def initialize(filas, columnas, elemento)
		@filas = filas
		@columnas = columnas
		@elemento = Array.new(elemento)
	end

	def to_s
		@imprimir = ""
		@filas.times do |i|
			@columnas.times do |j|
				@imprimir << "#{elemento[i][j]} "
			end
			@imprimir << "\n"
		end
		@imprimir
	end
end

if __FILE__ == $0
# Trabajo con la clase:
a = Matriz.new(2,2,[[1,2],[3,4]])
puts a
end