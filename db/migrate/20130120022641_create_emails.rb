class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.integer :id
      t.string :title
      t.integer :rank
      t.string :content
      t.datetime :date_created

      t.timestamps
    end
  end
end
