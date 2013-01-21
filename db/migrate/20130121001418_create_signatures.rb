class CreateSignatures < ActiveRecord::Migration
  def change
    create_table :signatures do |t|
      t.string :title
      t.string :content
      t.integer :id

      t.timestamps
    end
  end
end
