class Subject < ActiveRecord::Base
  def self.search(query)
    if query
      where("name like ?", "%#{query}%")
    else
      scoped
    end
  end
end
