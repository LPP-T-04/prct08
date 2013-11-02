class Matriz
	attr_accessor :filas, :columnas, :elemento

	def initialize(filas, columnas, elemento)
		@filas = filas
		@columnas = columnas
		@elemento = Array.new(elemento)
	end

	def to_s
		imprimir = ""
		@filas.times do |i|
			@columnas.times do |j|
				imprimir << "#{elemento[i][j]} "
			end
			imprimir << "\n"
		end
		imprimir
	end

	def +(other)
		raise ArgumentError, "La longitud de las matrices no coincide." unless @filas == other.filas && @columnas == other.columnas
		elemento = Array.new
		@filas.times do |i|
			elemento_fila = Array.new
			@columnas.times do |j|
				elemento_fila << @elemento[i][j] + other.elemento[i][j]
			end
			elemento << elemento_fila
		end
		Matriz.new(@filas, @columnas,elemento)
	end

	def -(other)
		raise ArgumentError, "La longitud de las matrices no coincide." unless @filas == other.filas && @columnas == other.columnas
		elemento = Array.new
		@filas.times do |i|
			elemento_fila = Array.new
			@columnas.times do |j|
				elemento_fila << @elemento[i][j] - other.elemento[i][j]
			end
			elemento << elemento_fila
		end
		Matriz.new(@filas, @columnas,elemento)
	end

	def *(other)
		elemento = Array.new
		@filas.times do |i|
			elemento_fila = Array.new
			@columnas.times do |j|
				elemento_fila << @elemento[i][j] * other
			end
			elemento << elemento_fila
		end
		Matriz.new(@filas, @columnas,elemento)
	end

	def x(other)
		raise ArgumentError, "La longitud de las matrices no coincide." unless @columnas == other.filas
		elemento = Array.new
		acumulado = 0
		@filas.times do |i|
			elemento_fila = Array.new
			other.columnas.times do |j|
				acumulado = 0
				@columnas.times do |k|
					acumulado += @elemento[i][k] * other.elemento[k][j]
				end
				elemento_fila << acumulado
			end
			elemento << elemento_fila
		end
		Matriz.new(@filas, other.columnas, elemento)
	end

	def traspuesta
		elemento = Array.new
		@columnas.times do |i|
			elemento_fila = Array.new
			@filas.times do |j|
				elemento_fila << @elemento[j][i]
			end
			elemento << elemento_fila
		end
		Matriz.new(@columnas, @filas, elemento)
	end

end

if __FILE__ == $0
# Trabajo con la clase:
a = Matriz.new(2,2,[[1,2],[3,4]])
b = Matriz.new(3,2,[[1,2],[3,4],[5,6]])
d = Matriz.new(2,3,[[1,2,3],[4,5,6]])
e = Matriz.new(3,2,[[1,2],[3,4],[5,6]])
c = d.x(e)
puts c
puts d
puts d.traspuesta
end