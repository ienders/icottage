class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :gallery_id
      t.string :filename
      t.integer :width
      t.integer :height
      t.integer :comments_count, :default => 0

      t.timestamps
    end
    
    add_index :photos, :gallery_id
  end

  def self.down
    drop_table :photos
  end
end
