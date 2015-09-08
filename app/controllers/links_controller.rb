
class LinksController < ApplicationController
  before_filter :set_links, :only=>[:show]
  def index
  end

  def show
    flash[:link_info] = Link.where(id: params[:id], user_id: session[:user_id]) if current_user
    flash[:country] = View.select('country, count("id") as count').where(link_id: params[:id]).order("count desc").group('country')
    flash[:referrer] = View.select('referrer, count("id") as count').where(link_id: params[:id]).order("count desc").group('referrer')
    redirect_to "/users/"+(session[:user_id]).to_s
  end

  def update
  end

  def create
    # use faraday to get title of page
    @link = Link.new(link_params)
    @link.user_id = (current_user) ? session[:user_id] : 0
    @user_link = find_user_links(@link.long_url) if current_user
    unless @user_link
      if @link.save
        flash[:short_url] = @link.short_url
        render welcome_index_path
      else
        render welcome_index_path
      end
    else
      flash[:short_url] = @user_link.short_url
      # if current_user
      #   render "/users/#{session[:user_id]}"
      # else
        render welcome_index_path
      # end
    end
  end

  def new
    @link = Link.new
  end

  private
  def find_user_links(long_url)
    long_url = (long_url[0..3]=="http") ? long_url : "http://"+long_url
    Link.find_by_long_url_and_user_id(long_url, session[:user_id])
  end

  def link_params
    params.require(:link).permit(:long_url)
  end

  def set_links
    @link = Link.find_by short_url: params[:id] || nil
  end
end
