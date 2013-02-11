class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title
      t.text :description
      t.boolean :active

      t.timestamps
    end
    add_index :groups, :user_id 
	add_index :groups, :membership_id 

  end
end
