class View < ActiveRecord::Base
  belongs_to :link, :counter_cache => true

  def self.top_countries(link_id)
    self.select('country, count("id") as count').where(link_id: link_id).order("count desc").group('country').limit(5)
  end

  def self.top_referrers(link_id)
    self.select('referrer, count("id") as count').where(link_id: link_id).order("count desc").group('referrer').limit(5)
  end

end
