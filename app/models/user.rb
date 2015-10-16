class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :wikis
  has_many :collaborators
   has_many :wikis, through: :collaborators

  
  before_save { self.email = email.downcase}
 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  enum role: [:member, :admin, :premium]
  
 def down_grade 
       
        Wiki.where(user: self).each do |f|
          f.update_attribute(:private, false)
        end
 end 

end
