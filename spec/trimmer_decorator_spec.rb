require_relative '../trimmer_decorator'
require_relative '../nameable'

RSpec.describe TrimmerDecorator do
  let(:nameable) { double('Nameable', correct_name: 'John Doe') }
  subject(:decorator) { described_class.new(nameable) }

  describe '#correct_name' do
    it 'returns the trimmed name' do
      expect(decorator.correct_name).to eq('John Doe')
    end
  end
end
