require 'rails_helper'

RSpec.describe Boardgame do
  it {should belong_to :company}
  it { validate_presence_of(:name) }
  it { validate_presence_of(:rank) }
  describe '#games_sold_out' do
    it 'only shows you true records' do
      @riogrande = Company.create!(name: "Rio Grande", games_invented: 3, independent: false)
      @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: true)
      @catan = @riogrande.boardgames.create!(name: 'Catan', rank: 7, out_of_print: false)
      @cephalofair = Company.create!(name: "Cephalofair", games_invented: 18, independent: true)
      @gloomhaven = @cephalofair.boardgames.create!(name: 'Gloomhaven', rank: 239, out_of_print: false)
      @forge = @cephalofair.boardgames.create!(name: 'Forgwar', rank: 89, out_of_print: true)

      expect(Boardgame.games_sold_out).to eq([@puerto, @forge])
    end
  end
#   As a visitor
# When I visit the Parent's children Index Page
# Then I see a link to sort children in alphabetical order
# When I click on the link
# # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
  describe '#alphabetical' do
    it 'returns boardgames in alphabetical order' do
      @riogrande = Company.create!(name: "Rio Grande", games_invented: 3, independent: false)
      @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: true)
      @catan = @riogrande.boardgames.create!(name: 'Catan', rank: 7, out_of_print: false)
      @cephalofair = Company.create!(name: "Cephalofair", games_invented: 18, independent: true)
      @gloomhaven = @cephalofair.boardgames.create!(name: 'Gloomhaven', rank: 239, out_of_print: false)
      @forge = @cephalofair.boardgames.create!(name: 'Forgwar', rank: 89, out_of_print: true)

      expect(Boardgame.alphabetical).to eq([@catan, @forge, @gloomhaven, @puerto])
    end
  end
  describe '#alphabetical' do
    it 'returns boardgames in alphabetical order' do
      @riogrande = Company.create!(name: "Rio Grande", games_invented: 3, independent: false)
      @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: true)
      @catan = @riogrande.boardgames.create!(name: 'Catan', rank: 7, out_of_print: false)
      @cephalofair = Company.create!(name: "Cephalofair", games_invented: 18, independent: true)
      @gloomhaven = @cephalofair.boardgames.create!(name: 'Gloomhaven', rank: 239, out_of_print: false)
      @forge = @cephalofair.boardgames.create!(name: 'Forgwar', rank: 89, out_of_print: true)

      expect(Boardgame.alphabetical).to eq([@catan, @forge, @gloomhaven, @puerto])
    end
  end
  describe '#limit_by_rank/1' do
    it 'returns only the boardgames more than that ranks' do
      @riogrande = Company.create!(name: "Rio Grande", games_invented: 3, independent: false)
      @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: true)
      @catan = @riogrande.boardgames.create!(name: 'Catan', rank: 7, out_of_print: false)
      @cephalofair = Company.create!(name: "Cephalofair", games_invented: 18, independent: true)
      @gloomhaven = @cephalofair.boardgames.create!(name: 'Gloomhaven', rank: 239, out_of_print: false)
      @forge = @cephalofair.boardgames.create!(name: 'Forgwar', rank: 89, out_of_print: true)

      expect(Boardgame.limit_by_rank(20)).to eq([@gloomhaven, @forge])
    end
  end
end
