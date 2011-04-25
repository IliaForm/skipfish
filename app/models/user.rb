class User < ActiveRecord::Base
  acts_as_authentic
  validates :login,               :presence => true, :uniqueness => true
  validates :crypted_password,    :presence => true
  validates :password_salt,       :presence => true        
  has_many :user_session,         :dependent =>:destroy
  has_many :sites,                :dependent =>:destroy
 
  def reduce_chances
    self.chances-=1
  end

end   

