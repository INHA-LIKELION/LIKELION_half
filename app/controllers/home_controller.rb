class HomeController < ApplicationController

  def index
    @kitshares = Kitshare.all
  end
end
