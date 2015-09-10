module ApplicationHelper
  def format_url(url)
    if url.length > 70
      url[0..70]+"..."
    else
      url
    end
  end
end
