require 'rails_helper'

RSpec.describe 'the company index page', type: :feature do
  #user story 1
  it 'lists all the companies and attributes' do
    company = Company.create!(name: 'mattel', independent: false, games_listed: 150)
    company_2 = Company.create!(name: 'tops', independent: false, games_listed: 25)
    visit "/companies"
    within '.companies-list' do

    expect(page).to have_content(company.name)
    expect(page).to have_content(company_2.name)

  end
end
  it 'lists all companies paths' do
    company = Company.create!(name: 'mattel', independent: false, games_listed: 150)
    company_2 = Company.create!(name: 'tops', independent: false, games_listed: 25)
    visit "/companies"
    within '.companies-list' do

    expect(page).to have_link(company.name, href: company_url(company))
    expect(page).to have_link(company_2.name, href: company_url(company_2))

    end 
  end
end
