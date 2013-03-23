class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |c|
      c.string :content, :null => false
      c.references :question, :null => false
      c.timestamps
    end
  end
end
