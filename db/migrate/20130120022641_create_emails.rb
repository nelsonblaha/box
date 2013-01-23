class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :id
      t.string :title
      t.integer :rank
      t.string :content
      t.datetime :date_created
      t.integer :user_id

      t.timestamps
    end
    add_index :emails, :user_id
  end
end
