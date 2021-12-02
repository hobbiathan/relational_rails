require 'rails_helper'



# User Story 5, Parent Children Index (x2)
#
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:
RSpec.describe 'Companies boardgames index' do
  before :each do
    @riogrande = Company.create!(name: "Rio Grande")
    @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: false)
    @catan = @riogrande.boardgames.create!(name: 'Catan')
  end
  it 'shows all the boardgames for the artist' do
    visit "/companies/#{@riogrande.id}/boardgames"
    # within '.boardgames-list' do
    expect(page).to have_content(@puerto.name)
    expect(page).to have_content(@catan.name)
  end
  it 'links to each boardgames show page' do
    visit "/companies/#{@riogrande.id}/boardgames"


    click_on @puerto.name

    # within '.boardgames-list' do
      expect(current_path).to eq("/boardgames/#{@puerto.id}")
      save_and_open_page
    end

end
