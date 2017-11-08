require 'rails_helper'

feature 'User uploads a new item' do
    scenario 'fills fields and submits' do
        before_count = Upload.count
        visit uploads_new_path
        fill_in 'file_name', with: 'Image Test'
        attach_file('file', Rails.root + 'public/logo.png')
        click_button 'Punch It, Chewie'
        expect(Upload.count).not_to eq(before_count)
        expect(page).to have_content 'Upload was saved to disk'
    end
end