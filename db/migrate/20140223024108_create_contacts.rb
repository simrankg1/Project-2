class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :username
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
