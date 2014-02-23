class CreateMeets < ActiveRecord::Migration
  def change
    create_table :meets do |t|
      t.string :comment
      t.integer :time
      t.string :address
      t.float :lat
      t.float :lgn
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
