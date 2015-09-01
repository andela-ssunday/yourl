class LinksController < ApplicationController
  # respond_to :js
  before_filter :set_links, :only=>[:show]
  def index
  end

  def show
    if !@link.nil?
      redirect_to @link.long_url
    end
  end

  def update
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:short_url] = @link.short_url
      redirect_to welcome_index_path
    else
      redirect_to welcome_index_path
    end
  end

  def new
    @link = Link.new
  end

  private
  def link_params
    params.require(:link).permit(:long_url)
  end

  def set_links
    @link = Link.find_by short_url: params[:id] || nil
  end
end
