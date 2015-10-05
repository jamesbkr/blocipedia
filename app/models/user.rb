class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :wikis
  after_initialize :init 
  
  before_save { self.email = email.downcase}
 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  enum role: [:member,:admin, :premium]
  
  
  
  
  def init
      self.role = :member
  end

end
