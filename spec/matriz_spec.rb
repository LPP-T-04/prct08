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
	describe "Acceder al subindice;" do
		it "Para acceder al [0,0]" do
			@m1.elemento[0][0].should eq(1)
		end
		it "Para acceder al [0,0]" do
			@m1.elemento[0][1].should eq(2)
		end
		it "Para acceder al [0,0]" do
			@m1.elemento[1][0].should eq(3)
		end
		it "Para acceder al [0,0]" do
			@m1.elemento[1][1].should eq(4)
		end
end
