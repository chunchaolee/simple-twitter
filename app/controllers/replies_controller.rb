class RepliesController < ApplicationController

  def index
    @tweet = Tweet.find(params[:tweet_id])
    @replies = @tweet.replies
    @reply = Reply.new
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.replies.create(reply_params)
    @reply.user_id = current_user.id
    
    if @reply.save
      flash[:notice] = "留言成功！"
      redirect_to tweet_replies_path(@tweet)
    else
      flash[:alert] = @reply.errors.full_messages.to_sentence
      redirect_to tweet_replies_path(@tweet)
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:comment)
  end

end
