require 'rails_helper'

RSpec.describe 'the companies show page' do
  it 'displays the company and attributes' do
    company = Company.create!(name: 'mattel')
    visit "/companies/#{company.id}"
    expect(page).to have_content(company.name)
  end

end
