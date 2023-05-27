require_relative '../student'

RSpec.describe Student do
  let(:student) { Student.new(16) }
  let(:classroom) { Classroom.new('Math') }

  describe '#play_hooky' do
    it 'returns a play hooky message' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end

  describe '#classroom=' do
    it 'sets the classroom for the student' do
      student.classroom = classroom
      expect(student.classroom).to eq(classroom)
    end

    it 'adds the student to the classroom' do
      student.classroom = classroom
      expect(classroom.students).to include(student)
    end

    it 'does not add the student multiple times' do
      student.classroom = classroom
      student.classroom = classroom
      expect(classroom.students.count(student)).to eq(1)
    end
  end
end
