require_relative '../decorator'

RSpec.describe Decorator do
  let(:nameable) { double('Nameable', correct_name: 'John Doe') }
  subject(:decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(decorator.correct_name).to eq('John Doe')
    end
  end
end
