class TopController < ApplicationController

  PER_PAGE = 1

  def index
  end

  def search
    @packages = Package.eager_load(:package_items)
                       .where('packages.description like ?', "%#{params[:q]}%").page(params[:page]).per(PER_PAGE)
  end
end
