class VotesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @vote = @post.votes.new(secure_params)
    @vote.user_id = current_user.id if current_user

# current_user.votes.where(post_id: @post, vote: 1).exists? || current_user.votes.where(post_id: @post, vote: -1 ).exists?
    if logged_in?
      if @post.votes.where(user_id: current_user, vote: 1).exists? || @post.votes.where(user_id: current_user, vote: -1).exists?
        @existing_vote = Vote.find_by(post_id: @post.id)
        @existing_vote.destroy
        flash[:danger] = "You removed your vote for \"#{@post.title}\""
        redirect_to posts_path
      else
        @vote.save
        flash[:success] = "Thanks #{current_user.username.capitalize} for casting your vote for \"#{@post.title}\""
        respond_to do |format|
          format.html { redirect_to posts_path }
          format.js
        end
      end
    else
      flash[:danger] = "You have to be signed in to make a vote"
      redirect_to posts_path
    end

  end

  private
    def secure_params
      params.require(:vote).permit(:user_id, :vote, :post_id)
    end

end
