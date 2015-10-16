class CollaboratorsController < ApplicationController
    def create
        @user = User.find_by(email: params[:email])
        @wiki = Wiki.find(params[:wiki_id])
        
        if !@user
            flash[:error] = "No user with that email: #{params[:email]}"
        elsif Collaborator.create(user: @user, wiki: @wiki)
            flash[:notice] = "Added collaborator successfully"
        else
            flash[:error] = "Something went wrong. Try again."
        end
        redirect_to edit_wiki_path(@wiki)
    end
    
    def destroy
        @collaborator = Collaborator.find(params[:id])
        @wiki = Wiki.find(params[:wiki_id])
        
        
        if @collaborator.destroy
                flash[:notice] = "collaborator removed"
        else
                flash[:error] = "there was an error removing the collaborator"
        end
        redirect_to edit_wiki_path(@wiki)
    end
end
