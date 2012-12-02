# File: matriz_spec.rb

require 'matriz'

describe Matriz do
  
  before :each do
    @m = Matriz
  end

  it "Argumentos de la matriz bien definidos" do
  	lambda { @m.new(1, 0)}.should raise_error(IndexError)
  	lambda { @m.new(-1, 1, 1)}.should raise_error(IndexError)
  	lambda { @m.new(1, 1, 1, 2)}.should raise_error(IndexError)
  end

  it "Se debe poder sumar dos matrices de enteros" do
  	lambda { @m.new(2, 3, 1) + @m.new(3, 2, 1)}.should raise_error(IndexError)
  	(@m.new(2, 3, 1) + @m.new(2, 3, 2)).should == @m.new(2, 3, 3)
  	(@m.new(2, 3, 1) + @m.new(2, 3, 1)).should_not == @m.new(2, 3, 3)
  	(@m.new(2, 3, 1) + @m.new(2, 3, 1) + @m.new(2, 3, 1)).should == @m.new(2, 3, 3)
  end

end