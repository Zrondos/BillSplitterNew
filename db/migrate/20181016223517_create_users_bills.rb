class CreateUsersBills < ActiveRecord::Migration[5.2]
  def change
    create_table :users_bills do |t|
      t.integer :user_id
      t.integer :bill_id 

      t.timestamps
    end
  end
end
