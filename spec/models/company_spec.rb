require 'rails_helper'

RSpec.describe Company do
  it {should have_many :boardgames}
end
