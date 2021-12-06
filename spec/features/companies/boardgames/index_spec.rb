require 'rails_helper'
RSpec.describe 'Companies boardgames index' do
  before :each do
    @riogrande = Company.create!(name: "Rio Grande")
    @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: true)
    @catan = @riogrande.boardgames.create!(name: 'Catan', rank: 2, out_of_print: true)
  end
  it 'shows all the boardgames for the artist' do
    #user story 5
    visit "/companies/#{@riogrande.id}/boardgames"
    within '.boardgames-list' do
    expect(page).to have_content(@puerto.name)
    expect(page).to have_content(@catan.name)
  end
end
  it 'links to each boardgames show page' do
    visit "/companies/#{@riogrande.id}/boardgames"

    within '.boardgames-list' do
      click_on @puerto.name
      expect(current_path).to eq("/boardgames/#{@puerto.id}")
    end
  end
  it 'links to each boardgames edit page' do
    visit "/companies/#{@riogrande.id}/boardgames"

     find('#edit') do
      first(:link, "Edit").click
      expect(current_path).to eq("/boardgames/#{@puerto.id}/edit")
    end
  end
  describe '#alphabetizes the index page' do
   it 'has an alphabetize button' do
     visit "/companies/#{@riogrande.id}/boardgames"
     expected = ['Catan', 'Puerto Rico']
    # within '#the' do
      click_link "Alphabetize"

      expect(current_path).to eq("/companies/#{@riogrande.id}/boardgames")
      expect(page.find_all('#list').map(&:text)).to eq(expected)
    end
  end
  describe '#user limits rank' do
    it 'only returns the boardgames with that rank or more' do
      visit "/companies/#{@riogrande.id}/boardgames"
      within '.ranks' do
        fill_in :rank, with: 10
        click_button "Only Return Records with Lesser Rank than submited"
      end
      expect(page).to have_content('Puerto Rico')
      expect(page).to_not have_content(@catan.name)
    end
    end
  end
