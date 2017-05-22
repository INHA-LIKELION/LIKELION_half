class ToolgroupController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def toolgroupindex
    @toolgroups = Toolgroup.page params[:page]
  end

  def create
    @user = User.find(current_user.id)
    toolgroup = @user.toolgroups.new

    toolgroup.title = params[:title]
    toolgroup.content = params[:content]

    imgUploader = ImgUploader.new
    imgUploader.store!(params[:img])

    toolgroup.img_url = imgUploader.url
    toolgroup.save

    redirect_to '/toolgroup/toolgroupindex'
  end

  def destroy
    toolgroup = Toolgroup.find(params[:id])
    toolgroup.toolgroupcomments.destroy_all
    toolgroup.destroy

    redirect_to '/toolgroup/toolgroupindex'
  end

  def update
    @toolgroup = Toolgroup.find(params[:id])
  end

  def real_update
    toolgroup = Toolgroup.find(params[:id])
    toolgroup.content = params[:content]
    toolgroup.save

    redirect_to '/toolgroup/toolgroupindex'
  end

  def comment_create
    @user = User.find(current_user.id)
    @toolgroup = Kitshare.find(params[:toolgroup_id])
    @toolgroupcomment = @user.toolgroupcomments.new(toolgroup_id:params[:toolgroup_id], content:params[:content])
    @toolgroupcomment.save

    redirect_to :back
  end

  def comment_destroy
    Toolgroupcomment.destroy(params[:id])

    redirect_to '/toolgroup/toolgroupindex'
  end
end
