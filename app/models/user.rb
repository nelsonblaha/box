class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  #dependent destroy causes an email's votes to be burned with it on the funeral pyre, Conan-style
    has_many :votes, dependent: :destroy
  has_many :emails, through: :votes
  has_many :signatures

  def created_email(email)
    if Vote.where(user_id:self.id,email_id:email.id,creator:true).count > 0
      return true
    elsif Vote.where(email_id:email.id,creator:true).count > 0
      return nil
    else
      return false
    end
  end
end
