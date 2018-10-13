require 'rails_helper'
feature 'Join Features' do
  before do
    @user = create(:user)
    @user2 = create(:user, email: "andrew@tran.com")
    log_in 
    @event = create(:event, user: @user)
    @event2 = create(:event, user:@user2)
  end 
  feature 'event has not been joined' do
    before(:each) do 
      visit '/events'
    end     
    scenario "join count updated correctly" do
      expect(page).to have_text(@event.name)
      expect(page).to have_text('0 people are attending')
    end
    scenario "displays join button if you haven't joined the event" do 
      expect(page).to have_button('Join')
    end
    scenario "joining will update join count, join button not visible" do 
      click_button "Join"
      expect(page).to_not have_button("Join")
      expect(page).to have_text('1 people are attending')
    end
  end
  feature "event has been joined" do 
    before do 
      @join = create(:join, user: @user, event: @event)
    end
    before(:each) do 
      visit '/events'
    end     
    scenario "cancel button is visible" do 
      expect(page).to have_button("Cancel")
    end
    scenario "cancelling will update join count" do 
      click_button "Cancel"
      expect(page).to_not have_button("Cancel")
      expect(page).to have_text("0 people are attending")
    end
  end
end