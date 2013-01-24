class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :email_id
      t.boolean :creator

      t.timestamps
    end
  end
end
