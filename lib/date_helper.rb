require 'pry-byebug'
require 'json'

class CourseHelper
  attr_accessor :data_hash
  def initialize()
    file = File.read('public/course.json')
    @data_hash = JSON.parse(file)
  end
end

class InstructorHelper
  attr_accessor :data_hash
  def initialize()
    file = File.read('public/instructor.json')
    @data_hash = JSON.parse(file)
  end
end

class SubjectHelper
  attr_accessor :data_hash
  def initialize()
    file = File.read('public/subject.json')
    @data_hash = JSON.parse(file)
  end
end

# courses = CourseHelper.new.data_hash
# instructors = InstructorHelper.new.data_hash
# subjects = SubjectHelper.new.data_hash
#
# binding.pry
# puts "YES"
