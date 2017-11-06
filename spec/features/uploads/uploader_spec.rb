require 'rails_helper'

feature 'User uploads a new item' do
    scenario "they click to the upload page" do
        visit uploads_new_path
        fill_in 'file_name', with: 'README Test'
        attach_file('uploads__card-form-file', Rails.root + 'README.md')
        click_button 'Punch It, Chewie'
        expect(page).to have_content 'Success'
    end
    
end