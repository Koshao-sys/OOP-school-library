require_relative '../capitalize_decorator'

RSpec.describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'Kevin doe') }
  subject(:decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the name' do
      expect(decorator.correct_name).to eq('Kevin doe')
    end
  end
end
