class WelcomeController < ApplicationController
  before_filter :set_links, :only=>[:show]
  def index
  end

  def show
    if !@link.nil?
      redirect_to @link.long_url
    end
  end

  private
    def set_links
      @link = Link.find_by short_url: params[:id] || nil
    end
end
