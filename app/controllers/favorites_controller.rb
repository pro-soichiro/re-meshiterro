class FavoritesController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    # ここから
    favorite = Favorite.new()
    favorite.post_image_id = post_image.id
    favorite.user_id = current_user.id
    # ここまでは
    # favorite = current_user.favorites.new(post_image_id: post_image.id)
    # という一文にすることができる
    favorite.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    favorite = current_user.favorites.find_by(post_image_id: post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end

end
