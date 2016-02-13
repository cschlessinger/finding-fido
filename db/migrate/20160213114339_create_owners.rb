class CreateOwners < ActiveRecord::Migration
  def change
  	create_table :owners do |t|
  		t.string :name
  		t.string :phone
  		t.string :email
	  	t.string :bio
	  	t.string :image
	  end
  end
end
