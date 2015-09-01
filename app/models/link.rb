class Link < ActiveRecord::Base
  validates :long_url, presence: :true
  validates :short_url, uniqueness: :true

  before_save :generate_short_url

  private
    def url_check
      self.long_url = (self.long_url[0..4]=="http") ? "http://"+self.long_url : self.long_url  
    end

    def generate_short_url
      a = rand(1000..9000).to_s.split("")
      c = a.map { |i| ('a'..'z').to_a[i.to_i]}
      self.short_url = c.join
    end
end
