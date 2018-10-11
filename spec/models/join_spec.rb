require 'rails_helper'
RSpec.describe Join, type: :model do
  describe 'relationships' do
    before do
      @user = create(:user)
      @event = create(:event, name: 'name 1', date: '2000-01-01', location: 'location 1', user: @user)
      @join = create(:join, event: @event, user: @user)
    end
    it 'belongs to a user' do
      expect(@join.user).to eq(@user)
    end
    it 'belongs to a secret' do
      expect(@join.event).to eq(@event)
    end
  end
end