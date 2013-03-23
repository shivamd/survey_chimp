class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.references :user
      t.references :survey
      t.timestamps
    end
  end
end
