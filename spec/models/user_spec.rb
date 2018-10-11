require 'rails_helper'
RSpec.describe User, type: :model do
  context "with valid attributes" do 
    it "should save" do 
      expect(build(:user)).to be_valid
    end
    it 'automatically encrypts the password into the password_digest attribute' do
      expect(build(:user).password_digest.present?).to eq(true)
    end 
    it 'email as lowercase' do 
      expect(create(:user, email: 'EMAIL@GMAIL.COM').email).to eq('email@gmail.com')
    end
  end
  context "with invalid attributes should not save if" do 
    it 'first_name is blank' do
      expect(build(:user, first_name: '')).to be_invalid
    end
    it 'last_name is blank' do
      expect(build(:user, last_name: '')).to be_invalid
    end
    it 'email is blank' do
      expect(build(:user, email: '')).to be_invalid
    end
    it 'email format is wrong' do
      emails = ["@user", "@example.com"]
      emails.each do |email|
        expect(build(:user, email: email)).to be_invalid
      end
    end
    it 'email is not unique' do
      create(:user)
      expect(build(:user)).to be_invalid
    end
    it 'city is blank' do
      expect(build(:user, city: '')).to be_invalid
    end
    it 'state is blank' do
      expect(build(:user, state: '')).to be_invalid
    end
    it 'password is blank' do
      expect(build(:user, password: '')).to be_invalid
    end
    it "password doesn't match password_confirmation" do
      expect(build(:user, password_confirmation: 'notpassword')).to be_invalid
    end
  end
  context 'relationships' do
    before do
      @user = create(:user)
      @event = create(:event, name: 'name 1', date: '2000-01-01', location: 'location 1', user: @user)
      @join = create(:join, event: @event, user: @user)
    end
    it 'has secrets' do
      expect(@user.events).to include(@event)
    end
    it 'has joins' do
      expect(@user.joins).to include(@join)
    end
    it "has events through joins table" do 
      expect(@user.events_joined).to include(@event)
    end
  end
end