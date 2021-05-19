class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string 'first_name'
      t.string 'last_name'
      t.string 'email'
      t.string 'password_digest'
      t.string 'profile_picture'
      t.integer 'facebookId', :null => true
      t.integer 'googleId', :null => true
      t.timestamps
    end
  end
end
