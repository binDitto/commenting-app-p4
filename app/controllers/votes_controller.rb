class VotesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @vote = @post.votes.new(secure_params)
    @vote.user_id = current_user.id if current_user

# current_user.votes.where(post_id: @post, vote: 1).exists? || current_user.votes.where(post_id: @post, vote: -1 ).exists?
    if @post.votes.where(user_id: current_user, vote: 1).exists? || @post.votes.where(user_id: current_user, vote: -1).exists?
      @existing_vote = Vote.find_by(post_id: @post.id)
      @existing_vote.destroy
      flash[:danger] = "Vote removed"
      redirect_to posts_path
    else
      @vote.save
      flash[:success] = "Vote recorded!"
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
    end

  end
  private
    def secure_params
      params.require(:vote).permit(:user_id, :vote, :post_id)
    end

end
