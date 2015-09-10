require 'rails_helper'

RSpec.describe User, type: :model do

  it 'should create a user' do
    ore = User.create({email: 'ore@gmail.com',username: 'Ore', password: "oreo"})
    alex = User.create({email: 'alex@gmail.com',username: 'Alex', password: "alexis"})
    kay = User.create({username: 'Alex', password: "alexis"})

    expect(ore).to be_valid
    expect(alex).to be_valid
    expect(kay).not_to be_valid
    
  end
end
