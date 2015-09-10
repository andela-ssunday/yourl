class Link < ActiveRecord::Base
  belongs_to :user
  has_many :views
  validates :long_url, presence: :true
  validates :short_url, uniqueness: :true

  before_save :generate_short_url
  before_save :url_check

  def self.link_info(link_id, user_id)
    self.where(id: link_id, user_id: user_id)
  end

  private
    def url_check
      self.long_url = (self.long_url[0..3]=="http") ? self.long_url : "http://"+self.long_url
    end

    def generate_short_url
      begin
          url = SecureRandom.hex[0..4]
          self.short_url = url
      end while Link.exists?(short_url: url)
    end


    scope :recent_links, ->{select('short_url').where(user_id: 0).order('id desc').limit(5)}
    scope :top_links, ->{select('short_url').where(user_id: 0).order('views_count desc').limit(5)}
end
