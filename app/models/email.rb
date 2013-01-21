class Email < ActiveRecord::Base
  attr_accessible :content, :date_created, :id, :rank, :title
  belongs_to :user
end
