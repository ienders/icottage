class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    
    create_table :bookings_users, :id => false do |t|
      t.column :user_id,    :integer, :null => false
      t.column :booking_id, :integer, :null => false
    end
    
    add_index :bookings_users, :user_id
    add_index :bookings_users, :booking_id
  end

  def self.down
    drop_table :bookings_users
    drop_table :bookings
  end
end
