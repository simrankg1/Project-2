class CreateInviteOwners < ActiveRecord::Migration
  def change
    create_table :invite_owners do |t|
      t.belongs_to :user, index: true
      t.belongs_to :invite, index: true

      t.timestamps
    end
  end
end
