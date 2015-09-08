class Link < ActiveRecord::Base
  belongs_to :user
  has_many :views
  validates :long_url, presence: :true
  validates :short_url, uniqueness: :true

  before_save :generate_short_url
  before_save :url_check

  private
    def url_check
      self.long_url = (self.long_url[0..3]=="http") ? self.long_url : "http://"+self.long_url
    end

    def generate_short_url
      a = rand(1000..9000).to_s.split("")
      c = a.map { |i| ('a'..'z').to_a[i.to_i]}
      self.short_url = c.join
    end


    scope :recent_links, ->{select('long_url, MAX(id) as max_id').where(user_id: 0).order('max_id desc').group('long_url').limit(5)}
    scope :top_links, ->{select('long_url, MAX("views_count") as count').where(user_id: 0).order('count desc').group('long_url').limit(5)}
end
