class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_a_id, null: false
      t.integer :user_b_id, null: false
      t.timestamps
    end
  end
end
