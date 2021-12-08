# User Story 20, Child Delete (x2)
#
# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child

require 'rails_helper'

RSpec.describe 'destroying an boardgame' do
  it 'can delete the artist from the index page' do
    emperor = Company.create!(name: "Emperors of eternal evil", games_invented: 23)
    cave_evil = emperor.boardgames.create!(name: "Cave Evil", rank: 10, out_of_print: true)
    visit "/boardgames/#{cave_evil.id}"


    click_button 'Delete Board Game'
    expect(current_path).to eq('/boardgames')
    expect(page).to_not have_content(cave_evil.name)
  end
end
