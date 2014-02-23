ok class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :time
      t.string :address
      t.float :lat
      t.float :lgn
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
