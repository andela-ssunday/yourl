class WelcomeController < ApplicationController
  before_filter :set_links, :only=>[:show]

  def index
    @recents = Link.recent_links
    @top_links = Link.top_links
  end

  def show
    redirect_to @link.long_url
  end

  private
    def set_links
      @link = Link.find_by short_url: params[:id]
      if @link
        ViewWorker.perform_async(@link.id, request.referrer, request.remote_ip, request.location.country)
      else
        no_record_error
      end
    end

    def no_record_error
      flash[:notice] = "No record Found"
      redirect_to root_path
    end
end
