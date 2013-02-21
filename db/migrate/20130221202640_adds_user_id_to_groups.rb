class AddsUserIdToGroups < ActiveRecord::Migration
  def up
  	add_column :groups, :user_id, :integer
  end

  def down
  	add_column :groups, :user_id
  end
end
