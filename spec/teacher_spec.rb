require_relative '../teacher'

RSpec.describe Teacher do
  let(:teacher) { Teacher.new(35, 'Math') }

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be true
    end
  end

  describe '#name' do
    it 'returns the teacher\'s name' do
      expect(teacher.name).to eq('Unknown')
    end

    it 'returns the teacher\'s name when provided' do
      teacher_with_name = Teacher.new(40, 'English', name: 'John Doe')
      expect(teacher_with_name.name).to eq('John Doe')
    end
  end

  describe '#age' do
    it 'returns the teacher\'s age' do
      expect(teacher.age).to eq(35)
    end
  end

  describe '#specialization' do
    it 'returns the teacher\'s specialization' do
      expect(teacher.specialization).to eq('Math')
    end
  end

  describe '#parent_permission' do
    it 'returns true' do
      expect(teacher.parent_permission).to be true
    end
  end
end
