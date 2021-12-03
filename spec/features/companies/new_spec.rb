require 'rails_helper'

RSpec.describe 'GET #new' do
  
  it 'creates new company with form' do
    visit '/companies/new'
     within ".new-company" do

      fill_in :name, with: 'Mattel'
      fill_in :games_invented, with: 125
      select(true, from: :independent )

    click_button 'Create Company'
    expect(Company.last[:name]).to eq('Mattel')
    expect(Company.last[:games_invented]).to eq(125)
    expect(Company.last[:independent]).to eq(true)
  end
end

  it 'doesnt save company without a name' do
    visit '/companies/new'
    # within ".new-company" do

      fill_in :name, with: nil
      fill_in :games_invented, with: 125
      select(true, from: :independent )

    click_button 'Create Company'
    expect(Company.all).to eq([])
  end

  it 'saves company without games_invented' do
    visit '/companies/new'
    # within ".new-company" do

      fill_in :name, with: "Tops"
      fill_in :games_invented, with: nil
      select(true, from: :independent )

    click_button 'Create Company'
    expect(Company.all.length).to eq(1)
  end
  it 'wont save company without :independent' do
    visit '/companies/new'
    # within ".new-company" do

      fill_in :name, with: "Tops"
      fill_in :games_invented, with: nil
      select(false, from: :independent )

    click_button 'Create Company'
    expect(Company.all.length).to eq(1)
  end
end
