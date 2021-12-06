require 'rails_helper'

RSpec.describe Company do
  # it {should have_many :boardgames}
  it { validate_presence_of(:name) }
  it {should have_many(:boardgames).dependent(:delete_all) }
  #user story 6
  describe '#most_recent' do
    it 'lists the company in order of created_at date' do
      @riogrande = Company.create!(name: "Rio Grande", games_invented: 42, independent: false)
      @emperors = Company.create!(name: "Emperors of Eternal Evil", games_invented: 11, independent: true)
      @cephalofair = Company.create!(name: "Cephalofair", games_invented: 18, independent: true)
      all = Company.all
      expect(all.most_recent).to eq([@cephalofair, @emperors, @riogrande])
    end
  end
  describe '#boardgame_count' do
    it 'lists the number of boardgames associated with' do
      @riogrande = Company.create!(name: "Rio Grande", games_invented: 3, independent: false)
      @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: false)
      @catan = @riogrande.boardgames.create!(name: 'Catan', rank: 7, out_of_print: false)
      @cephalofair = Company.create!(name: "Cephalofair", games_invented: 18, independent: true)
      @gloomhaven = @cephalofair.boardgames.create!(name: 'Gloomhaven', rank: 239, out_of_print: false)


      expect(@riogrande.boardgame_count).to eq(2)
      expect(@cephalofair.boardgame_count).to eq(1)
    end
  end
end
