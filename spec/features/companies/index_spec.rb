require 'rails_helper'

RSpec.describe 'the company index page', type: :feature do
  #user story 1
  it 'lists all the companies and attributes' do
    company = Company.create!(name: 'mattel', independent: false, games_invented: 150)
    company_2 = Company.create!(name: 'tops', independent: false, games_invented: 25)
    visit "/companies"
    within '.companies-list' do

    expect(page).to have_content(company.name)
    expect(page).to have_content(company_2.name)

  end
end
  describe 'index paths'
    it 'lists all companies paths' do
      company = Company.create!(name: 'mattel', independent: false, games_invented: 150)
      company_2 = Company.create!(name: 'tops', independent: false, games_invented: 25)
      @riogrande = Company.create!(name: "Rio Grande", games_invented: 63, independent: false)
      @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: false)
      visit "/companies"
      within '.companies-list' do

        expect(page).to have_link(company.name, href: company_url(company))
        expect(page).to have_link(company_2.name, href: company_url(company_2))
      end
    end

  it 'links to boardgames path' do
    #user story 8
    @riogrande = Company.create!(name: "Rio Grande", games_invented: 63, independent: false)
    @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: false)
    visit "/companies"
    within '.boardgames' do


    expect(page).to have_link('Board Games Link', href: '/boardgames')
    end
  end
  it 'links to new company path' do
    #user story 8
    @riogrande = Company.create!(name: "Rio Grande", games_invented: 63, independent: false)
    @puerto = @riogrande.boardgames.create!(name: 'Puerto Rico', rank: 13, out_of_print: false)
    visit "/companies"
    within '.new-company' do


    expect(page).to have_link('Add New Company', href: '/companies/new')
    end
  end
  it 'has created_at dates next to the company' do
    @riogrande = Company.create!(name: "Rio Grande", games_invented: 42, independent: false)
    @emperors = Company.create!(name: "Emperors of Eternal Evil", games_invented: 11, independent: true)
    @cephalofair = Company.create!(name: "Cephalofair", games_invented: 18, independent: true)
    visit "/companies"
    within '.companies-list' do

    expect(page).to have_content(@riogrande.created_at.httpdate)
    expect(page).to have_content(@emperors.created_at.httpdate)
    expect(page).to have_content(@cephalofair.created_at.httpdate)

    end
  end
  it 'has an edit button next to every compnay' do
    @riogrande = Company.create!(name: "Rio Grande", games_invented: 42, independent: false)
    @emperors = Company.create!(name: "Emperors of Eternal Evil", games_invented: 11, independent: true)
    @cephalofair = Company.create!(name: "Cephalofair", games_invented: 18, independent: true)
    visit "/companies"
    within '.companies-list' do

    expect(page).to have_link("Edit", href: "/companies/#{@riogrande.id}/edit")
    expect(page).to have_link("Edit", href: "/companies/#{@emperors.id}/edit")
    expect(page).to have_link("Edit", href: "/companies/#{@cephalofair.id}/edit")
      find('#edit') do
        first(:link, "Edit").click
        expect(current_path).to eq("/companies/#{@cephalofair.id}/edit")
      end
    end
  end
end
