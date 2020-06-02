class CompleteController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def edit
    end

    def update
        @post.update_attribute(:completed_at, Time.now)
        redirect_to root_path, notice: "Todo item completed"    
    end

    private
  
    def set_post
        @post = Post.find(params[:id])
      end

      
    def post_params
        params.require(:post).permit(:content, :date)
    end
end
