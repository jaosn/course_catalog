class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.text :name
      t.string :abb

      t.timestamps null: false
    end
  end
end
