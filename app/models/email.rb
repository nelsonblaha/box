class Email < ActiveRecord::Base
  attr_accessible :content, :date_created, :id, :rank, :title

  has_many :votes, dependent: :destroy
  has_many :users, through: :votes

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end


end 
  def creator
  	#find the user who created the email and return it to wherever this method was called
  		creator_vote = Vote.where(email_id:self.id,creator:true).first
  		return creator_vote.user
  end

  def humorous_rank
  	if self.votes.count < 2
  		"'Cool story, bro...'"
  	elsif 1 < self.votes.count < 4
  		"One hit wonder"
  	else
  		"Essential"
  	end
  end
end
