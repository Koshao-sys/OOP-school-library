class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  # Define function to add student to Classroom students array.
  def add_student(student)
    @students << student
    student.classroom = self
  end
end
