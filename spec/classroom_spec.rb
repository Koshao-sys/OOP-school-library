require_relative '../classroom'
require_relative '../student'

RSpec.describe Classroom do
  let(:classroom_label) { 'Mathematics' }
  let(:student1) { Student.new('John Doe') }
  let(:student2) { Student.new('Jane Smith') }

  describe '#initialize' do
    it 'sets the label' do
      classroom = Classroom.new(classroom_label)
      expect(classroom.label).to eq(classroom_label)
    end

    it 'initializes an empty list of students' do
      classroom = Classroom.new(classroom_label)
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      classroom = Classroom.new(classroom_label)
      classroom.add_student(student1)
      expect(classroom.students).to include(student1)
    end

    it 'sets the classroom for the student' do
      classroom = Classroom.new(classroom_label)
      classroom.add_student(student1)
      expect(student1.classroom).to eq(classroom)
    end
  end
end
