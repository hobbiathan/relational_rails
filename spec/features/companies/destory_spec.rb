# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent
require 'rails_helper'

RSpec.describe 'destroying an artist' do
  it 'can delete the artist from the index page' do
    riogrande = Company.create!(name: "Riogrande")
    visit "/companies/#{riogrande.id}"

    
    click_button 'Delete Company'
    expect(current_path).to eq('/companies')
    expect(page).to_not have_content(riogrande.name)
  end
end
