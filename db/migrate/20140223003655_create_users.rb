class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :name
      t.string :phone
      t.text :bio
      t.string :username

      t.timestamps
    end
  end
end
