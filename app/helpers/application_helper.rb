module ApplicationHelper
  def format_url(url)
    if url.length > 90
      url[0..90]+"..."
    else
      url
    end
  end
end
