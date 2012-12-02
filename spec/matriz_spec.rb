# File: matriz_spec.rb

require 'matriz'

describe Matriz do
  
  before :each do
    @m = Matriz
    @fr = Fraccion
  end

  it "Argumentos de la matriz bien definidos" do
  	lambda { @m.new(1, 0)}.should raise_error(IndexError)
  	lambda { @m.new(-1, 1, 1)}.should raise_error(IndexError)
  	lambda { @m.new(1, 1, 1, 2)}.should raise_error(IndexError)
  end

  it "Se debe poder sumar dos matrices de enteros" do
  	lambda { @m.new(2, 3, 1) + @m.new(3, 2, 1)}.should raise_error(IndexError)
  	(@m.new(2, 3, 1) + @m.new(2, 3, -2)).should == @m.new(2, 3, -1)
  	(@m.new(2, 3, 1) + @m.new(2, 3, 1)).should_not == @m.new(2, 3, 3)
  	(@m.new(2, 3, 1) + @m.new(2, 3, 1) + @m.new(2, 3, 1)).should == @m.new(2, 3, 3)
  end

  it "Se debe poder sumar dos matrices de racionales" do
  	lambda { @m.new(2, 3, @fr.new(1, 2)) + @m.new(3, 2, @fr.new(1, 2))}.should raise_error(IndexError)
  	(@m.new(2, 3, @fr.new(1, 2)) + @m.new(2, 3, @fr.new(1, 2))).should == @m.new(2, 3, @fr.new(1, 1))
    (@m.new(2, 3, @fr.new(-1, 2)) + @m.new(2, 3, @fr.new(2, 4))).should == @m.new(2, 3, @fr.new(0, 1))
  	(@m.new(2, 3, @fr.new(1, 2)) + @m.new(2, 3, @fr.new(1, 2))).should_not == @m.new(2, 3, @fr.new(3, 2))
  	(@m.new(2, 3, @fr.new(1, 2)) + @m.new(2, 3, @fr.new(1, 2)) + @m.new(2, 3, @fr.new(1, 2))).should == @m.new(2, 3, @fr.new(3, 2))
  end

  it "Se debe poder multiplicar una matriz de Enteros" do
    lambda { @m.new(2, 3, 1) * @m.new(2, 3, 1)}.should raise_error(IndexError)
    lambda { @m.new(-1, 3, 1) * @m.new(3, 3, 1)}.should raise_error(IndexError)
    (@m.new(1, 2, 2) * @m.new(2, 1, 3)).should == @m.new(1, 1, 12)
    (@m.new(2, 2, 1, 0, 0, 1) * @m.new(2, 2, 1)).should == @m.new(2, 2, 1)
    (@m.new(2, 2, 1, 0, 0, 1) * @m.new(2, 2, -1)).should_not == @m.new(2, 2, 2)
  end

end