class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.belongs_to :course, index: true
      t.string :subject_id
      t.timestamps null: false
    end
  end
end
