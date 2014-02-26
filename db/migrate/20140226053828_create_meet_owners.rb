class CreateMeetOwners < ActiveRecord::Migration
  def change
    create_table :meet_owners do |t|
      t.belongs_to :user, index: true
      t.belongs_to :meet, index: true

      t.timestamps
    end
  end
end
