class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :last
      t.string :first
      t.string :middle
      t.string :email

      t.timestamps null: false
    end
  end
end
