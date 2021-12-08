require 'rails_helper'

RSpec.describe Warroom, type: :model do
  it {should belong_to :country}
end
