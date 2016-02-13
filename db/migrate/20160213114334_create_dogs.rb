class CreateDogs < ActiveRecord::Migration
  def change
  	create_table :dogs do |t|
  		t.string :breed
	  	t.string :bio
	  end
  end
end
