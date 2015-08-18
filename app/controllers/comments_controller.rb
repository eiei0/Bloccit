class CommentsController < ApplicationController
  
  def create

    post = Post.find(params[:post_id])
    comment = post.comments.new(comment_params)
    comment.user = current_user
    if comment.save

      flash[:notice] = "The comment was saved successfully!"
      redirect_to [post.topic, post]

    else

      flash[:error] = "There was an error saving the comment. Please try again."
      redirect_to [post.topic, post]

    end

  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end