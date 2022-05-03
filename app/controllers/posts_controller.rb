class PostsController < ApplicationController
	def index
    @posts = current_user.posts
  end 
  
  def show
     @post = current_user.posts.find(params[:id])
  end 
  
  def edit
     @post = current_user.posts.find(params[:id])
  end 
  
  def new
     @post = current_user.posts.new
  end 
  
  def create 
     @post = current_user.posts.new(post_params) 
     if @post.save
        redirect_to @post
     else
        render :new 
     end
  end   

   def update
       @post = current_user.posts.find(params[:id]) 

       if @post.update(post_params)
         redirect_to posts_path
       else
          render :edit
       end 
    end    

    def destroy
      @post = current_user.posts.find(params[:id])
      @post.destroy

      redirect_to posts_path
    end 

  def post_params
    params.require(:post).permit(:user_id, :title, :description )
  end          

end
