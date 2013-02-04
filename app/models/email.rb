class Email < ActiveRecord::Base
  attr_accessible :content, :date_created, :id, :rank, :title

  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
end
