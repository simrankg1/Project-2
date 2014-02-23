class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.date :date
      t.time :time
      t.string :address
      t.float :lat
      t.float :lng
      t.integer :owner

      t.timestamps
    end
  end
end
