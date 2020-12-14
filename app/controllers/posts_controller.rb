class PostsController < ApplicationController

  before_action :only_login_user
  before_action :only_correct_user, {only: [:edit, :update, :destroy]}

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(syoku: params[:syoku], niku: params[:niku],
      kekku: params[:kekku], user_id: @current_user.id)
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.syoku = params[:syoku]
    @post.niku = params[:niku]
    @post.kekku = params[:kekku]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

  def only_correct_user
    @post = Post.find_by(id: params[:id])
    if @current_user.id != @post.user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
  
end
