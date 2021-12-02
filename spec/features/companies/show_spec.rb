require 'rails_helper'

RSpec.describe 'the company show page' do
  # User Story 2
  it 'displays the the specific company and attributes' do
    company = Company.create!(name: 'mattel')
    visit "/companies/#{company.id}"
    expect(page).to have_content(company.name)
  end


end
