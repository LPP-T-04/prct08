require "matriz.rb"

describe Matriz do
	describe "Se comprueba el numero de: " do
		it "Filas para una matriz 2x2" do
			@filas.should eq(2)
		end
		it "Columnas de una matriz 2x2" do
			@columnas.should eq(2)
		end
	end
end
