require_relative 'Ave'
require_relative 'AveGuerrillera'
require_relative 'SuperFrom'

class Golondrina
  include AveGuerrillera
  include Ave
  include SuperFrom

  attr_accessor :energia

  def initialize
    self.energia = 1000
  end

  def volar(km)
    self.energia -= 10 * km
  end

  def comer(gramos)
    self.energia += gramos * 5
  end

  def gracia
    super_from(AveGuerrillera)
  end
end

#main
pepita = Golondrina.new
pepita.gracia
