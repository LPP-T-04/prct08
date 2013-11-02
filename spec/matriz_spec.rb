require "matriz.rb"

describe Matriz do
	before :each do
		@m1 = Matriz.new(2,2,[[1,2],[3,4]])
		@m2 = Matriz.new(2,2,[[2,4],[6,8]])
		@m3 = Matriz.new(2,2,[[7,10],[15,22]])
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

	describe "Imprimir la matriz" do
		it "del orden 2x2" do
			@m1.to_s.should eq("1 2 \n3 4 \n")
		end
	end

	describe "Suma de dos matrices" do
		it "del orden mxn" do
			@m1.+(@m1).to_s.should eq(@m3.to_s)
		end
	end

	describe "Resta de dos matrices" do
		it "del orden mxn" do
			@m2.-(@m1).to_s.should eq(@m1.to_s)
		end
	end

	describe "Multiplicacion de un numero por una matriz" do
		it "del orden mxn" do
			@m1.*(2).to_s.should eq(@m2.to_s)
		end
	end

	describe "Multiplicacion de matrices" do
		it "del orden axn x nxb" do
			@m1.x(@m1).to_s.should eq(@m3.to_s)
		end
	end
end
