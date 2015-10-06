class WelcomeController < ApplicationController
  def index
    @user = current_user
    if current_user.member?
        current_user.wikis.each do |f|
          f.update_attribute(:private, false)
        end
    end    
  end

  def about
  end
end
