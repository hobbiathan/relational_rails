require 'rails_helper'

RSpec.describe Country do
  it {should have_many :warrooms}
  it {should validate_presence_of :country_name}

  describe 'class methods' do
    it '::desc_order' do
      @country = Country.create!(military_power_rank: 5, country_name: "The Velviathan", nuclear_power: true)
      @country_two = Country.create!(military_power_rank: 4, country_name: "The State of Hobbiathan", nuclear_power: true)

      expect(Country.desc_order).to eq([@country_two, @country])
    end
    it '#child_count' do
      @country = Country.create!(military_power_rank: 5, country_name: "The Velviathan", nuclear_power: true)
      @warroom = @country.warrooms.create!(strategic_importance: 5, warroom_name: "Sector 3N", deadman_switch: true, contains_wmd: true)

      expect(@country.child_count).to eq(1)
    end
  end
end
