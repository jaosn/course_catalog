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



courses = CourseHelper.new.data_hash
instructors = InstructorHelper.new.data_hash
subjects = SubjectHelper.new.data_hash

courses.each do |single|
  req = single["requirements"]
  if req.length == 0 then act = "" else act = req[0] end
  Course.create(name: single['name'],description: single["description"],code: single["code"],requirement: act)
end

puts "course done"

instructors.each do |s|
  Instructor.create(last: s["last"],first: s["first"], middle: s["middle"], email: s["email"])
end

puts "instructor done"

subjects.each do |s|
  Subject.create(name: s["name"], abb: s["abbreviation"])
end

puts "subject done"
