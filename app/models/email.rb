class Email < ActiveRecord::Base
  attr_accessible :content, :date_created, :id, :rank, :title
end