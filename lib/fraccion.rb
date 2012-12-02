# File: fraccion.rb

class Fraccion

	# Módulo: utilidad ordenar, definir operador <=>
	include Comparable 

	# getter y setter
	attr_accessor :num, :den

  def initialize (num, den)
    raise TypeError, "No se puede dividir por 0" unless den != 0
    comun = mcd(num, den)
    @num = num/comun
    @den = den/comun
  end

	#----------------------------------------------------------------------
 	# mcm y mcd, métodos necesarios para los operadores +, - y reducción
 	#----------------------------------------------------------------------
	
	def mcd(a, b)
	  # mcd por el Alg. de Euclides (recursivamente)
	  b == 0 ? a : mcd(b, a % b)
 	end
  
  def mcm(a, b)
	  # Por el Alg. de Euclides, a través del mcd
	  (a * b)/mcd(a, b)
 	end

 	#----------------------------------------------------------------------
 	# Convertidor: a string o a float
 	#----------------------------------------------------------------------

	def to_s
    "#{self.class} #{@num}/#{@den}"
  end
  
  def to_f
    @num/@den
  end


 	#----------------------------------------------------------------------
 	# Operadores
 	#----------------------------------------------------------------------

	def == (fr)
    ((self.num == fr.num) && (self.den == fr.den))
  end
  
  def abs
    Fraccion.new(@num.abs, @den)
  end
  
  def reciproco
    Fraccion.new(@den, @num)
  end
  
  def -@
    Fraccion.new(-@num, @den)
  end
    
  def + (fr)
    comun = mcm(self.den, fr.den)
    Fraccion.new(comun/self.den * self.num + comun/fr.den * fr.num, comun)
  end 
  
  def - (fr)
    self + (-fr)
  end
  
  def * (fr)
    Fraccion.new(self.num * fr.num, self.den * fr.den)
  end
  
  def / (fr)
    self * fr.reciproco
  end
  
  def % (fr)
    return ((self.num * fr.den) % (self.den * fr.num))
  end

  # operadores <, <=, >, >= 
  def <=> (fr)
  	(self.num * fr.den) <=> (self.den * fr.num) 
  end

  # Para poder realizar operaciones entre distintas clases, ej:  * obj
	def coerce(other)
	  [self, other]
	end

end