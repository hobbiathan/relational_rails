# User Story 12, Parent Update (x2)
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
require 'rails_helper'

RSpec.describe '#edit' do
  it 'links to the edit page' do
    riogrande = Company.create!(name: "Riogrande", games_invented: 293, independent: false)

    visit "/companies/#{riogrande.id}"
    within ".parent-edit" do

      expect(page).to have_link('Update Company', href: "/companies/#{riogrande.id}/edit")
    end
  end
  it 'routes to the edit artist page' do
    riogrande = Company.create!(name: "Riogrande", games_invented: 293, independent: false)

    visit "/companies/#{riogrande.id}"

    click_link "Update Company"
    expect(current_path).to eq("/companies/#{riogrande.id}/edit")
  end
  it 'can edit the company' do
      riogrande = Company.create!(name: "Riogrand", games_invented: 293, independent: false)
      visit "/companies/#{riogrande.id}"
      
      expect(page).to have_content("Riogrand")
      expect(page).to have_content(293)
      expect(page).to have_content(false)


      click_link "Update Company"
      within '.update-company'
      fill_in :name, with: 'Riogrande'
      fill_in :games_invented, with: 356
      select(:false, from: :independent )
      click_button 'Submit Update'

      expect(current_path).to eq("/companies/#{riogrande.id}")
      expect(page).to have_content("Riogrande")
    end
  end
