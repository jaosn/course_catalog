class AddLatteIdToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :latte_id, :string
    
  end
end
