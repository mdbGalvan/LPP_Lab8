# File: fraccion_spec.rb

require 'fraccion'

describe Fraccion do
  
  before :each do
    @fr = Fraccion
  end
  
  it "Debe existir un numerador" do
    @fr.new(1, 2).num.should == 1
  end
  
  it "Debe existir un denominador" do
    @fr.new(1, 2).den.should == 2
  end
  
  it "El denominador tiene que ser distinto de cero" do
    lambda { @fr.new(1, 0)}.should raise_error(TypeError)
  end
  
  it "Debe de estar en su forma reducida" do
    @fr.new(2, 4).num.should == 1
    @fr.new(7, -21).den.should == 3
  end
  
  it "Se debe invocar al metodo num() para obtener el numerador" do
    @fr.new(1, 2).respond_to?("num").should be_true
  end

  it "Se debe invocar al metodo denom() para obtener el denominador" do
    @fr.new(1, 2).respond_to?("den").should be_true
  end
  
  it "Se debe mostar por la consola la fraccion de la forma: a/b, donde a es el numerador y b el denominador" do
    @fr.new(1, 2).to_s.should == "Fraccion 1/2"
    @fr.new(7, -21).to_s.should == "Fraccion -1/3"
    @fr.new(-2, 6).to_s.should == "Fraccion -1/3"
  end
  
  it "Se debe mostar por la consola la fraccion en formato flotante" do
    @fr.new(1, 2).to_f.should == 1/2
    @fr.new(7, -21).to_f.should == -1/3
    @fr.new(-2, 6).to_f.should == -1/3
  end
  
  it "Se debe comparar si dos fracciones son iguales con ==" do
    @fr.new(1, 2).should == @fr.new(2, 4)
    @fr.new(1, -2).should == @fr.new(-2, 4)
    @fr.new(1, 2).should_not == @fr.new(3, 4)
  end
  
  it "Se debe calcular el valor absoluto de una fraccion con el metodo abs" do
    @fr.new(-2, 3).abs.should == @fr.new(2, 3)
    @fr.new(2, -4).abs.should == @fr.new(1, 2)
    @fr.new(-1, 2).abs.should_not == @fr.new(-1, 2)
  end
  
  it "Se debe calcular el reciproco de una fraccion con el metodo reciprocal" do
    @fr.new(-2, 3).reciproco.should == @fr.new(-3, 2)
    @fr.new(2, -4).reciproco.should == @fr.new(-2, 1)
    @fr.new(21, 3).reciproco.should == @fr.new(1, 7)
  end
  
  it "Se debe calcular el opuesto de una fraccion con -" do
    (-@fr.new(-2, 3)).should == @fr.new(2, 3)
    (-@fr.new(2, -4)).should == @fr.new(1, 2)
    (-@fr.new(21, 3)).should == @fr.new(-7, 1)
  end
  
  it "Se debe sumar dos fracciones con + y dar el resultado de forma reducida" do
    (@fr.new(1, 1) + @fr.new(1, 1)).should == @fr.new(2, 1)
    (@fr.new(1, 2) + @fr.new(1, 4)).should == @fr.new(3, 4)
    (@fr.new(2, 5) + @fr.new(-3, 2)).should == @fr.new(-11, 10)
    (@fr.new(3, 2) + @fr.new(12, -3)).should == @fr.new(-5, 2)
  end
  
  it "Se debe restar dos fracciones con - y dar el resultado de forma reducida" do
    (@fr.new(1, 1) - @fr.new(1, 1)).should == @fr.new(0, 1)
    (@fr.new(1, 2) - @fr.new(1, 4)).should == @fr.new(1, 4)
    (@fr.new(2, 5) - @fr.new(-3, 2)).should == @fr.new(19, 10)
    (@fr.new(3, 2) - @fr.new(12, -3)).should == @fr.new(11, 2)
  end
  
  it "Se debe multiplicar dos fracciones con * y dar el resultado de forma reducida" do
    (@fr.new(1, 1) * @fr.new(1, 1)).should == @fr.new(1, 1)
    (@fr.new(1, 2) * @fr.new(1, 4)).should == @fr.new(1, 8)
    (@fr.new(2, 5) * @fr.new(-3, 2)).should == @fr.new(-3, 5)
    (@fr.new(3, 2) * @fr.new(12, -3)).should == @fr.new(-6, 1)
  end
    
  it "Se debe dividir dos fracciones con / y dar el resultado de forma reducida" do
    (@fr.new(1, 1) / @fr.new(1, 1)).should == @fr.new(1, 1)
    (@fr.new(1, 2) / @fr.new(1, 4)).should == @fr.new(2, 1)
    (@fr.new(2, 5) / @fr.new(-3, 2)).should == @fr.new(4, -15)
    (@fr.new(3, 2) / @fr.new(12, -3)).should == @fr.new(-3, 8)  
  end
  
  it "Se debe calcular el resto dos fracciones con % y dar el resultado de forma reducida" do
    (@fr.new(5, 1) % @fr.new(2, 1)).should == 1
    (@fr.new(7, 1) % @fr.new(4, 1)).should == 3
    (@fr.new(1, 2) % @fr.new(1, 4)).should == 0
    (@fr.new(6, 1) % @fr.new(17, 1)).should == 6
    (@fr.new(3, 5) % @fr.new(4, 7)).should == 1    
  end
  
  it "Se debe de poder comprobar si una fracion es menor que otra" do
    (@fr.new(1, 1) < @fr.new(2, 1)).should be_true
    (@fr.new(1, 4) < @fr.new(1, 2)).should be_true
    (@fr.new(-3, 2) < @fr.new(2, 5)).should be_true
    (@fr.new(12, -3) < @fr.new(3, 2)).should be_true
  end
  
  it "Se debe de poder comprobar si una fracion es mayor que otra" do
    (@fr.new(2, 1) > @fr.new(1, 1)).should be_true
    (@fr.new(1, 2) > @fr.new(1, 4)).should be_true
    (@fr.new(2, 5) > @fr.new(-3, 2)).should be_true
    (@fr.new(3, 2) > @fr.new(12, -3)).should be_true  
  end
  
  it "Se debe de poder comprobar si una fracion es menor o igual que otra" do  
    (@fr.new(1, 1) <= @fr.new(1, 1)).should be_true
    (@fr.new(1, 4) <= @fr.new(1, 2)).should be_true
    (@fr.new(-3, 2) <= @fr.new(2, 5)).should be_true
    (@fr.new(12, -3) <= @fr.new(3, 2)).should be_true
  end
    
  it "Se debe de poder comprobar si una fracion es mayor o igual que otra" do
    (@fr.new(1, 1) >= @fr.new(1, 1)).should be_true
    (@fr.new(1, 2) >= @fr.new(1, 4)).should be_true
    (@fr.new(2, 5) >= @fr.new(-3, 2)).should be_true
    (@fr.new(3, 2) >= @fr.new(12, -3)).should be_true  
  end
  
end