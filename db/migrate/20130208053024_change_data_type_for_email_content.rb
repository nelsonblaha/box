class ChangeDataTypeForEmailContent < ActiveRecord::Migration
  def self.up
    change_table :emails do |t|
      t.change :content, :text
    end
  end
 
  def self.down
    change_table :emails do |t|
      t.change :content, :string
    end
  end
end
