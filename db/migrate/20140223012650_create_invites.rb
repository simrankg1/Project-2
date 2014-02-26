class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.time :time
      t.date :date
      t.string :address
      t.float :lat
      t.float :lng
      t.integer :ownerid

      t.timestamps
    end
  end
end
