class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers, {:id => false } do |a|
      a.references :user, :choice
      a.timestamps
    end
  end
end
