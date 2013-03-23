class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |s|
      s.string :title, :null => false
      s.string :description, :null => false
      s.references :user, :null => false
      s.references :photo
      s.timestamps
    end
  end
end 
