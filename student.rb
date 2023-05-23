require_relative 'person'

class Student < Person
  def initialize(age, classroom, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end

ask = Student.new(41, 'LT1')
puts ask.can_use_services?, ask.age, ask.name, ask.parent_permission
