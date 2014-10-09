class FavoritesController < ApplicationController
  before_filter :dump_params
  before_filter :find_user, only: [:index, :create]
  before_filter :find_favorite, except: [:index, :create]
  respond_to :json

  def index
    @favorites = Favorite.where(user_id: @user.id)
    respond_with(@favorites)
  end

  def create
    @favorite = Favorite.create params.require(:favorite).permit(:cut, :cut_id)
    respond_with @favorite
  end

  def show
    respond_with @favorite
  end

  def update
    @favorite.cut( params.require(:favorite).require(:cut) )
    respond_with @favorite
  end

  def destroy
    @favorite.destroy
    head 204
  end


  protected

  def dump_params
    #pp params
  end

  def find_user
    @user = User.find(params[:user_id])
  rescue ActiveRecord::RecordNotFound
    head 404
  end

  def find_favorite
    @favorite = Favorite.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head 404
  end

end
