class TopController < ApplicationController

  PER_PAGE = 30

  def index
  end

  def search
    q = "%#{params[:q]}%"
    @packages = Package.eager_load(:package_items)
                       .where('packages.description like ? or name like ?', q, q)
                       .order(stargazers_count: :desc)
                       .page(params[:page]).per(PER_PAGE)
  end
end
