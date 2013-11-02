require "matriz.rb"

describe Matriz do
	before :each do
		@m1 = Matriz.new(2,2)
	end

	describe "Se comprueba el numero de: " do
		it "Filas para una matriz 2x2" do
			@m1.filas.should eq(2)
		end
		it "Columnas de una matriz 2x2" do
			@m1.columnas.should eq(2)
		end
	end
end
