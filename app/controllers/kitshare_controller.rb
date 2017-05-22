class KitshareController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def kitshareindex
    @kitshares = Kitshare.page params[:page]
  end

  def create
    @user = User.find(current_user.id)
    kitshare = @user.kitshares.new

    kitshare.head = params[:head]
    kitshare.title = params[:title]
    kitshare.content = params[:content]

    imgUploader = ImgUploader.new
    imgUploader.store!(params[:img])

    kitshare.img_url = imgUploader.url
    kitshare.save

    redirect_to '/kitshare/kitshareindex'
  end

  def destroy
    kitshare = Kitshare.find(params[:id])
    kitshare.kitsharecomments.destroy_all
    kitshare.destroy

    redirect_to '/kitshare/kitshareindex'
  end

  def update
    @kitshare = Kitshare.find(params[:id])
  end

  def real_update
    kitshare = Kitshare.find(params[:id])
    kitshare.content = params[:content]
    kitshare.save

    redirect_to '/kitshare/kitshareindex'
  end

  def comment_create
    @user = User.find(current_user.id)
    @kitshare = Kitshare.find(params[:kitshare_id])
    @kitsharecomment = @user.kitsharecomments.new(kitshare_id:params[:kitshare_id], content:params[:content])
    @kitsharecomment.save

    redirect_to :back
  end

  def comment_destroy
    Kitsharecomment.destroy(params[:id])

    redirect_to '/kitshare/kitshareindex'
  end
end
