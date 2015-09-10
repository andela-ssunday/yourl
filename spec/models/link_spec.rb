require 'rails_helper'

RSpec.describe Link, type: :model do
    it 'should create a Link' do
      link1 = Link.create({long_url: 'www.google.com',short_url: 'qwer'})
      link2 = Link.create({long_url: 'www.twitter.com',short_url: 'werk'})
      link3 = Link.create({long_url: 'www.facebook.com',short_url: 'rytw'})


      expect(link1).to be_valid
      expect(link2).to be_valid
    end
end
