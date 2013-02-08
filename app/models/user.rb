class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body
  
  #dependent destroy causes an email's votes to be burned with it on the funeral pyre, Conan-style
    has_many :votes, dependent: :destroy
  has_many :emails, through: :votes
  has_many :signatures
   has_many :groups, :through => :memberships
  def created_email(email)
    if Vote.where(user_id:self.id,email_id:email.id,creator:true).count > 0
      return true
    elsif Vote.where(email_id:email.id,creator:true).count > 0
      return nil
    else
      return false
    end
  end

  def voted_for(email)
    if Vote.where(user_id:self.id,email_id:email.id).count > 0
      return true
    else
      return false
    end
  end

  def may_modify(email)
    if self.admin || self.created_email(email)
      true
    else
      false
    end
  end
  
end
