class Email < ActiveRecord::Base
  attr_accessible :content, :date_created, :id, :rank, :title

  has_many :votes, dependent: :destroy
  has_many :users, through: :votes

  def creator
  	#find the user who created the email and return it to wherever this method was called
  		return Vote.where(email_id:self.id,creator:true).first
  end
end
