class FavoritesController < ApplicationController

  def create
       post = Post.find(params[:post_id])
       favorite = post.favorites.build(user: current_user)
       authorize favorite
       if favorite.save
         flash[:notice] = "You have favorited this post sucessfully."
         redirect_to topic_post_path(post.topic, post)
       else
         flash[:error] = "There was an error favoriting this post. Please try again"
         redirect_to topic_post_path(post.topic, post)
       end
     end

   def destroy
     post = Post.find(params[:post_id])
     favorite = Favorite.find(params[:id])
     authorize favorite
    if favorite.destroy
     flash[:notice] = "You have removed this post from your favorites sucessfully."
     redirect_to topic_post_path(post.topic, post)
    else
     flash[:error] = "There was an error unfavoriting this post. Please try again"
     redirect_to topic_post_path(post.topic, post)
    end
  end
end