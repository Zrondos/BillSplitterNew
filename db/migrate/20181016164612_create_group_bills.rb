class CreateGroupBills < ActiveRecord::Migration[5.2]
  def change
    create_table :group_bills do |t|
      t.integer :admin_id
      t.string :name
      t.float :subtotal
      t.float :tax
      t.float :tip
      t.float :total
      
      t.timestamps
    end
  end
end
