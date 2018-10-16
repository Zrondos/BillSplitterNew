class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.integer :group_bill_id

      t.timestamps
    end
  end
end
