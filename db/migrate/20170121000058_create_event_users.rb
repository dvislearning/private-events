class CreateEventUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :event_users do |t|
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
  end
end
