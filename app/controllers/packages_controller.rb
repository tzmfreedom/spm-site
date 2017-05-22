class PackagesController < ApplicationController
  def show
    @package = Package.find(params[:id])
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    @readme = markdown.render(@package.readme)
  end
end
