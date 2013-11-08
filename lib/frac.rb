require "gcd.rb"
# Definicion de la clase Frac
class Frac
	attr_reader :numerador, :denominador # Se definen set y get para acceder a las variables de la clase.
	include Comparable # Se incluye el modulo de nombre "comparable" utilizado para el operador <=>.
	
    def initialize(numerador, denominador) # Se define el constructor.
		mcd = gcd(numerador,denominador)
		@numerador , @denominador = numerador/mcd, denominador/mcd
	end
	
    def num() # Devuelve el numerador.
		@numerador
	end
	
    def denom() # Devuelve el denominador.
		@denominador
	end
	
    def to_s
        if @denominador == 1 #Si el denominador es 1, solo se imprimer el numerador
                "#{@numerador}"
        elsif @denominador == -1 #En el caso de que b=-1 y a>0 ó a=-1
                if @numerador>0 || @numerador==-1
                        "#{-@numerador}"
                else #Si b=-1 y a es menor que cero, imprime el valor de a
                        "#{@numerador}"
                end
        elsif (@numerador>0 && @denominador>0 && @denominador!=1) #Caso nomal, a y b son mayores que cero, imprime a/b
                "#{@numerador}/#{@denominador}"
        elsif (@numerador>0 && @denominador<0 && @denominador!=-1) # b es menor que cero, se le cambia el signo a todo para que se imprima: -a/b
                "#{-@numerador}/#{-@denominador}"
        elsif (@numerador<0 && @denominador<0 && @denominador!=-1) # a y b son menor que cero, se le cambia el signo a todo para que imprima a/b
                "#{-@numerador}/#{-@denominador}"
        elsif (@numerador<0 && @denominador>0 && @denominador!=1) # a es menor que cero, se imprime igual: -a/b
                "#{@numerador}/#{@denominador}"
        end        
    end
	
    def to_f() # Imprime el resultado de la fraccion como un float.
		@numerador.to_f/@denominador
	end
	
    def <=>(other) # Se define el operador <=> para el modulo comparable.
    	@numerador.to_f/@denominador <=> other.numerador.to_f/other.denominador
    end
    
    def abs() # Se calcula el valor absoluto de una fraccion.
    	if (@numerador > 0 && @denominador > 0)
    		Frac.new(@numerador, @denominador).to_s
    	elsif (@numerador > 0 && @denominador < 0)
    		Frac.new(@numerador, -1 * @denominador).to_s
    	elsif (@numerador < 0 && @denominador > 0)
    		Frac.new(-1 * @numerador, @denominador).to_s
    	else (@numerador < 0 && @denominador < 0)
    		Frac.new(-1 * @numerador,-1 * @denominador).to_s
    	end  						
    end
    
    def reciprocal() # Calcula el reciproco de una fraccion.
    	Frac.new(@denominador, @numerador)
    end

    def +(other) # Calcula la suma de dos fracciones.
        Frac.new(@numerador*other.denominador + other.numerador*@denominador , @denominador*other.denominador)
    end

    def -(*other) # Calcula la resta de dos fracciones.
        if (other[0].class == Frac)
            Frac.new(@numerador*other[0].denominador - other[0].numerador*@denominador , @denominador*other[0].denominador)
        else
            if (@numerador > 0 && @denominador > 0)
                Frac.new(-1 * @numerador, @denominador)
            elsif (@numerador > 0 && @denominador < 0)
                Frac.new(@numerador, -1 * @denominador)
            elsif (@numerador < 0 && @denominador > 0)
                Frac.new(-1 * @numerador, @denominador)
            else (@numerador < 0 && @denominador < 0)
                Frac.new(@numerador, -1 * @denominador)
            end                    
        end
    end

    def *(other) # Calcula la multiplicacion de dos fracciones.
        Frac.new(@numerador * other.numerador, @denominador * other.denominador)
    end

    def /(other) # Calcula la division de dos fracciones.
        Frac.new(@numerador * other.denominador, @denominador * other.numerador)
    end

    def %(other) # Calcula el resto al dividir dos fracciones (modulo)
        result = self./(other)
        result = (result.numerador%result.denominador).to_i
    end
=begin
    def prct(other)
        result = self.*(other)
        result.abs
    end
=end
end
