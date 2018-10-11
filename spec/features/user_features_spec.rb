require 'rails_helper'
feature 'User features ' do
  before do
    # calling factory girl create method
    @user = create(:user)
  end
  feature "user sign-up" do
    before(:each) do
      visit "/users/new"
    end
    scenario 'visits sign-up page' do
      expect(page).to have_field('user[first_name]')
      expect(page).to have_field('user[last_name]')
      expect(page).to have_field('user[email]')
      expect(page).to have_field('user[city]')
      expect(page).to have_field('user[state]')
      expect(page).to have_field('user[password]')
      expect(page).to have_field('user[password_confirmation]')
    end
    scenario "with improper inputs, redirects back to sign in and shows validations" do
      click_button 'Register'
      expect(current_path).to eq('/users/new')
      expect(page).to have_text("can't be blank")
    end
    scenario "with proper inputs, create user and redirects to events index page" do 
        fill_in 'user[first_name]', with: "Kenny"
        fill_in 'user[last_name]', with: "Pham"
        fill_in 'user[email]', with: "kenny@pham.com"
        fill_in 'user[city]', with: "Fullerton"
        select 'California', from: 'user[state]'
        fill_in 'user[password]', with: "password"
        fill_in 'user[password_confirmation]', with: "password"
      click_button 'Register'
      expect(current_path).to eq("/events")
    end
  end
  feature "user dashboard" do 
    before do
      log_in
    end  
    scenario "displays user information" do 
      expect(page).to have_text("#{@user.first_name}")
      expect(page).to have_link('Edit My Profile')
    end
  end
end