require 'rspec'
require_relative '../src/Golondrina'
require_relative '../src/Ave'
require_relative '../src/AveGuerrillera'

describe('probando super_from') {
  let(:una_golondrina) do
    Golondrina.new
  end

  it 'deberia mostrarme que estoy en AveGuerrillera' do
    expect do
      una_golondrina.gracia
    end.to output(include 'AveGuerrillera').to_stdout
  end

}