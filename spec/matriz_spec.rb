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

end