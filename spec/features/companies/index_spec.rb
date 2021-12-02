require 'rails_helper'

RSpec.describe 'the company index page', type: :feature do
  #user story 1
  it 'lists all the companies and attributes' do
    company = Company.create!(name: 'mattel', independent: false, games_listed: 150)
    company_2 = Company.create!(name: 'tops', independent: false, games_listed: 25)
    visit "/companies"
    expect(page).to have_content(company.name)
    expect(page).to have_content(company_2.name)
  end
end
