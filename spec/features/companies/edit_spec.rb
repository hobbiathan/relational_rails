require 'rails_helper'

RSpec.describe '#edit', type: :feature do
  it 'can edit the company' do
      riogrande = Company.create!(name: "Riogrand", games_invented: 293, independent: false)
      visit "/companies/#{riogrande.id}"

      expect(page).to have_content("Riogrand")
      expect(page).to have_content(293)
      expect(page).to have_content(false)

      click_link "Update Company"

      within '.update-company' do
            fill_in :name, with: 'Riogrande', visible: true
            fill_in :games_invented, with: 356, visible: true
            select(:false, from: :independent )
            click_button 'Submit Update'
      end
      expect(current_path).to eq("/companies/#{riogrande.id}")
      expect(page).to have_content("Riogrande")
      expect(page).to have_content(356)
      expect(page).to have_content(false)
    end
  it 'wont update with nil values' do
      riogrande = Company.create!(name: "Riogrand", games_invented: 293, independent: false)
      visit "/companies/#{riogrande.id}"

      expect(page).to have_content("Riogrand")
      expect(page).to have_content(293)
      expect(page).to have_content(false)

      click_link "Update Company"

      within '.update-company' do
            fill_in :name, with: nil
            fill_in :games_invented, with: 356
            select(:false, from: :independent )
            click_button 'Submit Update'
      end

      expect(current_path).to eq("/companies/#{riogrande.id}")
      expect(page).to have_content("Riogrand")
      expect(page).to have_content(293)
      expect(page).to have_content(false)
    end
  end
