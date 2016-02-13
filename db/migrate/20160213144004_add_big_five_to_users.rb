class AddBigFiveToUsers < ActiveRecord::Migration
  def change
    add_column :users, :openness, :integer
    add_column :users, :agreeableness, :integer
    add_column :users, :extraversion, :integer
    add_column :users, :conscientiousness, :integer
    add_column :users, :emotional_range, :integer
  end
end
