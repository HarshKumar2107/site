class PostsController < ApplicationController
	def index
		@posts = current_user.posts.order(created_at: :desc)
	end

	def show
      @post = Post.find(params[:id])
    end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end


  private
    def post_params
      params.require(:post).permit(:desc, :like, :cover)
    end
end
