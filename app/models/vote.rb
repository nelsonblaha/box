class Vote < ActiveRecord::Base
  attr_accessible :creator, :email_id, :user_id

  belongs_to :email
  belongs_to :user
end
