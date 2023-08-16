require './person'

class Student < Person
  def initialize(age, classroom, name = 'unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
    classroom&.add_student(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  attr_accessor :classroom
  
  def to_hash
    {
      class: 'Student',
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission
    }
  end
end
