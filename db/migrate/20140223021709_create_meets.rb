class CreateMeets < ActiveRecord::Migration
  def change
    create_table :meets do |t|
      t.text :comment
      t.time :time
      t.date :date
      t.string :address
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
