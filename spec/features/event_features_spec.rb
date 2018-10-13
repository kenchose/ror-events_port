require 'rails_helper'
feature "event features" do 
  # before do 
  #   @user = create(:user)
  #   @user2 = create(:user, email: "user@user.com")
  #   @event = create(:event, user: @user)
  #   @event2 = create(:event, user: @user2)
  #   # @event = create(:event, name: 'EDC', detail: "It's gonna be lit", date: '2000-01-01', city: 'city 1', state: 'state 1', user: @user)
  #   log_in
  # end
  
#   feature "Users personal secret page" do
#     before do 
#       visit "/users/#{@user.id}"
#     end
#     # scenario "should be able to see events within and out of state" do 
#     #   expect(page).to have_text(@event2.detail)
#     # end    
#     scenario "create a new event" do
#       fill_in 'event[name]', with: "My new event"
#       click_button 'Create Event'
#       expect(current_path).to eq("/users/#{@user.id}")
#       expect(page).to have_text('My new event')
#     end
#     scenario "destroy secret from profile page, redirects to user profile page" do
#       secret = create(:secret, user: @user)
#       visit "/users/#{@user.id}"
#       click_button 'Delete Secret'
#       expect(current_path).to eq("/users/#{@user.id}")
#       expect(page).not_to have_text(secret.content)
#     end    
#   end
  feature "Event Dashboard" do 
    before do 
      @user = create(:user)
      @event = create(:event, user: @user)
      log_in
      visit "/events"
    end
    # before(:each) do 
    #   visit "/events"
    # end
    scenario "displays all events" do 
      expect(page).to have_text(@event.detail)
      # expect(page).to hsave_text(@event2.details)      
    end
    scenario "destroy secret from index page, redirects to user profile page" do 
      click_button 'Delete Event'
      expect(current_path).to eq(events_path)
      expect(page).not_to have_text(@event.detail)      
    end    
  end
end