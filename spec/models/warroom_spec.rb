require 'rails_helper'

RSpec.describe Warroom, type: :model do
  it {should belong_to :country}
  it {should validate_presence_of :warroom_name}
  describe 'class methods' do
    it '::has_wmds' do
      @country_two = Country.create!(military_power_rank: 4, country_name: "The State of Hobbiathan", nuclear_power: true)
      @wr = @country_two.warrooms.create!(strategic_importance: 5, warroom_name: "Sector 2B", deadman_switch: true, contains_wmd: false)
      @wr_2 = @country_two.warrooms.create!(strategic_importance: 4, warroom_name: "Khoslin", deadman_switch: false, contains_wmd: true)

      expect(Warroom.has_wmds).to eq([@wr_2])
    end
    it '::imporatnce_filter/1' do
      @country_two = Country.create!(military_power_rank: 4, country_name: "The State of Hobbiathan", nuclear_power: true)
      @wr = @country_two.warrooms.create!(strategic_importance: 2, warroom_name: "Sector 2B", deadman_switch: true, contains_wmd: false)
      @wr_2 = @country_two.warrooms.create!(strategic_importance: 4, warroom_name: "Khoslin", deadman_switch: false, contains_wmd: true)

      expect(Warroom.importance_filter(3)).to eq([@wr_2])
    end
  end
end
