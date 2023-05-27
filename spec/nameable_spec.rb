require_relative '../nameable'

RSpec.describe Nameable do
  subject(:nameable) { described_class.new }

  describe '#correct_name' do
    it 'raises NotImplementedError' do
      expect { nameable.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
