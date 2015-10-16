class WelcomeController < ApplicationController
  def index
    @user = current_user
    @wikis = Wiki.all
    @collaborations = Collaborator.where(user_id: current_user.id)
    if current_user.member?

    end    
  end

  def about
  end
end
