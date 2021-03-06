class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users", :force => true do |t|
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :first_name,                :string
      t.column :last_name,                 :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :is_admin,                  :boolean, :default => false
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime      
    end
    
    add_index :users, :email, :unique => true

    user = User.new(
        :login => 'ian',
        :email => 'ian.enders@gmail.com',
        :first_name => 'Ian',
        :last_name => 'Enders',
        :password => 'password',
        :password_confirmation => 'password',
        :is_admin => true
    )
    user.save_with_validation(false)
  end

  def self.down
    drop_table "users"
  end
end
