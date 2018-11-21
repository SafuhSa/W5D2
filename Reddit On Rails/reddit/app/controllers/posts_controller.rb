class PostsController < ApplicationController
  def new
    @post = Post.new
    render :new
  end

  def create
    @post = current_user.posts.new(pt_params)
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(pt_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end


  def pt_params
    params.require(:post).permit(:url, :title, :content, :user_id, sub_ids: [])
  end


end
