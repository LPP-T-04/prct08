require "matriz.rb"

describe Matriz do
	before :each do
		@m1 = Matriz.new(2,2,[[1,2],[3,4]])
		@m2 = Matriz.new(2,2,[[2,4],[6,8]])
		@m3 = Matriz.new(2,2,[[7,10],[15,22]])
		@m4 = Matriz.new(2,2,[[1,3],[2,4]])
		@m5 = Matriz.new(2,3,[[1,2,3],[4,5,6]])
		@m6 = Matriz.new(3,2,[[1,2],[3,4],[5,6]])
		@m7 = Matriz.new(2,2,[[22,28],[49,64]])
		@m8 = Matriz.new(3,2,[[1,4],[2,5],[3,6]])
		a = Frac.new(1,2)
		b = Frac.new(2,2)
		c = Frac.new(3,2)
		d = Frac.new(4,2)
		@m9 = Matriz.new(2,2,[[a,b],[c,d]])
		@m10 = Matriz.new(2,2,[[0,0],[0,0]])
		@m11 = Matriz.new(2,2,[[a,c],[b,d]])
		e = Frac.new(7,4)
		f = Frac.new(10,4)
		g = Frac.new(15,4)
		h = Frac.new(22,4)
		@m12 = Matriz.new(2,2,[[e,f],[g,h]])

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
			@m1.+(@m1).to_s.should eq(@m2.to_s)
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

	describe "Multiplicacion de matrices del orden axn x nxb" do
		it "del orden 2x2 x 2x2" do
			@m1.x(@m1).to_s.should eq(@m3.to_s)
		end
		it "del orden 2x3 x 3x2" do
			@m5.x(@m6).to_s.should eq(@m7.to_s)
		end
	end

	describe "Matriz traspuesta " do
		it "del orden nxn." do
			@m1.traspuesta.to_s.should eq(@m4.to_s)
		end
		it "del orden mxn" do
			@m5.traspuesta.to_s.should eq(@m8.to_s)
		end
	end

	describe "Trabajo con fracciones" do
		it "suma" do
			@m9.+(@m9).to_s.should eq (@m1.to_s)
		end
		it "resta" do
			@m9.-(@m9).to_s.should eq (@m10.to_s)
		end
		it "Multiplicacion" do
			@m9.x(@m9).to_s.should eq (@m12.to_s)
		end
		it "traspuesta" do
			@m9.traspuesta.to_s.should eq (@m11.to_s)
		end
	end

end
