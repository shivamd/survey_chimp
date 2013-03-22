class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false, :unique => true
      t.string :password_hash, :null => false
      t.string :email, :null => false, :unique => true
      t.timestamps
    end
  end
end
