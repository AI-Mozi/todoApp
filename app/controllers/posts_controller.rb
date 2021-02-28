class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]
  before_action :require_login

  def index
    @today_posts = current_user.posts.where('date BETWEEN ? AND ?',(Date.today),(Date.today + 1.day ))
    @week_posts = current_user.posts.where('date BETWEEN ? AND ?',(Date.today + 1.day ),(Date.today + 8.day ))
    @month_posts = current_user.posts.where('date BETWEEN ? AND ?', (Date.today + 8.days), (Date.today + 1.month + 1.day))
    @other_posts = current_user.posts.where('date > ?', (Date.today + 1.month + 1.day))
    @posts = current_user.posts
    @post = Post.new
  end


  def show
  end


  def new
    @post = current_user.posts.build
  end


  def edit
  end


  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
      if @post.update(post_params)
        redirect_to root_path, notice: 'Task was successfully updated.'
      else
        render :edit
      end
      
  end

 
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  
    def set_post
        @post = Post.find(params[:id])
      end

      
    def post_params
        params.require(:post).permit(:content, :date)
      end

    def require_login
        unless current_user
          redirect_to new_user_session_url
        end
      end
  
end
