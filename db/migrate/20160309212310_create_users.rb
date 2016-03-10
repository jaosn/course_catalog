class CreateUsers < ActiveRecord::Migration
  
  # def down
  #    drop_table :users
  # end

  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email

      t.timestamps null: false
    end
  end
end
