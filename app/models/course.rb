class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :relations
  has_many :users, through: :enrollments

  def self.search(query)
    where("name like ?", "%#{query}%")
  end
end
