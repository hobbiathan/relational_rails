require 'rails_helper'

RSpec.describe Boardgame do
  it {should belong_to :company}
  it { validate_presence_of(:name) }
  it { validate_presence_of(:rank) }
end
