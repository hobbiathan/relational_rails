require 'rails_helper'

RSpec.describe Country do
  it {should have_many :warrooms}
end
