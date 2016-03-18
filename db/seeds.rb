# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require_relative '../lib/date_helper'

Course.delete_all
Instructor.delete_all
Subject.delete_all
Relation.delete_all
Enrollment.delete_all

courses = CourseHelper.new.data_hash
instructors = InstructorHelper.new.data_hash
subjects = SubjectHelper.new.data_hash

courses.each do |single|
  req = single["requirements"]
  if req.length == 0 then act = "" else act = req[0] end
  c = Course.new(name: single['name'],description: single["description"],code: single["code"],requirement: act)
  c.save
  single["subjects"].each do |s|
    c.relations.create(subject_id: s["id"])
  end
end

puts "course done"

instructors.each do |s|
  Instructor.new(last: s["last"],first: s["first"], middle: s["middle"], email: s["email"]).save
end

puts "instructor done"


Subject.new.save
subjects.each do |s|
  Subject.new(name: s["name"], abb: s["abbreviation"], latte_id: s["id"]).save
end

puts "subject done"



# require 'pry-byebug'
#
# user = User.first
# course = Course.first
# user.courses += course
# Enrollment.create(course_id: course.id, user_id: user.id)
# puts user.courses
# puts user.username
# puts course.name
# #user.courses.create(course_id: course.id, user_id: user.id)
# binding.pry
#
# puts "yes"
