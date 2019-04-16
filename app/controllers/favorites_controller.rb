class FavoritesController < ApplicationController
  def index
    @images = current_user.favorites
    render 'images/index'
  end

  def create
    @favorite = Favorite.new(favorite_params)

    if @favorite.save
      flash[:notice] = "Favorite was added."
    end

    redirect_to images_path
  end

  private

  def favorite_params
    params.permit(:user_id, :hubble_id, :name, :description, :credits, :image_url)
  end
end
