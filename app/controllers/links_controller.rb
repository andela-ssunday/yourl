
class LinksController < ApplicationController
  before_filter :set_links, :only=>[:show]

  def index
  end

  def show
    get_link_details(params[:id])
    redirect_to "/users/"+(session[:user_id]).to_s
  end

  def update
  end

  def check_referrer
    if request.env["HTTP_REFERER"].include? 'users'
       redirect_to users_path+"/#{session[:user_id]}"
     else
       render welcome_index_path
    end
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = (current_user) ? session[:user_id] : 0
    @user_link = find_user_links(@link.long_url) if current_user
    unless @user_link
      if @link.save
        flash[:success] = "Url Successfully shortened"
        flash[:short_url] = @link.short_url
        get_link_details(@link.id)
        check_referrer
      end
    else
      flash[:success] = "Url Successfully shortened"
      flash[:short_url] = @user_link.short_url
      get_link_details(@user_link.id)
      check_referrer
    end
  end

  def new
    @link = Link.new
  end

  def get_link_details(id)
    flash[:link_info] = Link.link_info(id, session[:user_id]) if current_user
    flash[:country] = View.top_countries(id)
    flash[:referrer] = View.top_referrers(id)
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
