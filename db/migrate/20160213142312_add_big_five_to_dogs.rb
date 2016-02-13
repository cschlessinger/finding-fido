class AddBigFiveToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :openness, :integer
    add_column :dogs, :agreeableness, :integer
    add_column :dogs, :extraversion, :integer
    add_column :dogs, :conscientiousness, :integer
    add_column :dogs, :emotional_range, :integer
  end
end
