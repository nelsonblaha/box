class Email < ActiveRecord::Base
  attr_accessible :content, :date_created, :id, :rank, :title
  belongs_to :user
  #dependent destroy causes an email's votes to be burned with it on the funeral pyre, Conan-style
  	has_many :votes, dependent: :destroy
  
  has_many :users, through: :votes
end
