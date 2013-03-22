class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |q|
      q.string :content, :null => false
      q.references :survey, :null => false
      q.timestamps
    end
  end
end
