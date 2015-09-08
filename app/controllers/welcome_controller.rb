class WelcomeController < ApplicationController
  before_filter :set_links, :only=>[:show]

  def index
    @recents = Link.recent_links
    @top_links = Link.top_links
  end

  def show
    if !@link.nil?
      redirect_to @link.long_url
    else
      render welcome_index_path
    end
  end

  private
    def set_links
      @link = Link.find_by short_url: params[:id] || nil
      # location = Geokit::Geocoders::GoogleGeocoder.geocode('197.253.36.22')
      p request.location.country_code
      View.create(link_id: @link.id, referrer: request.referrer, request_ip: request.remote_ip, country: request.location.country)
    end
end
