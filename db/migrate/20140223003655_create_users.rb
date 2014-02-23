class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :name
      t.string :username
      t.string :phone
      t.text :bio

      t.timestamps
    end
  end
end
