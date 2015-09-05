class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end
  
  
  def show
    @wiki = Wiki.find(params[:id])
  end


  def new
    @wiki = Wiki.new
  end
  
  
  def create
     @wiki = Wiki.new
    
     @wiki.title = params[:wiki][:title]
     @wiki.body = params[:wiki][:body]
     @wiki.user = current_user
     @wiki.private = false
     if @wiki.save
       flash[:notice] = "Post was saved."
       redirect_to wikis_path
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
  end
  
  
  def edit
    @wiki = Wiki.find(params[:id])
  end
  def update 
    
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = false
     if @wiki.save
       flash[:notice] = "Post was saved."
       redirect_to wikis_path
     else
       flash[:error] = "There was an error saving the post. Please try again."
       render :new
     end
      
  end

 def destroy
   @wiki = Wiki.find(params[:id])
   if @wiki.destroy
     flash[:notice] = "Wiki Was DELETED!!!!"
     redirect_to wikis_path
   else
     flash[:notice] = "WIKI WAS NOT DESTROYED"
     render @wiki
   end
 end

end


