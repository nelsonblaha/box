class Email < ActiveRecord::Base
  attr_accessible :content, :date_created, :id, :rank, :title, :user_id
  belongs_to :user
end
