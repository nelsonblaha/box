class Group < ActiveRecord::Base
  attr_accessible :active, :description, :title
  has_many :users, through:  :memberships

end
