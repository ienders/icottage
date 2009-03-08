class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.integer :user_id
      t.string :name
      t.integer :photos_count

      t.timestamps
    end
    
    add_index :galleries, :user_id
  end

  def self.down
    drop_table :galleries
  end
end
