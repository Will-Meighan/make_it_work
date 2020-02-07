require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the contestants index page' do

    before :each do
      @challenge_1 = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      @challenge_2 = Challenge.create(theme: "Recycled Material", project_budget: 1000)

      @project_1 = @challenge_1.projects.create(name: "News Chic", material: "Newspaper")
      @project_2 = @challenge_2.projects.create(name: "Boardfit", material: "Cardboard Boxes")

      @contestant_1 =  @project_1.contestants.create(name: 'Will', age: 27, hometown: 'Ankeny', years_of_experience: 1)
      @contestant_2 =  @project_2.contestants.create(name: 'Bobby', age: 13, hometown: 'Denver', years_of_experience: 13)

      visit '/contestants'
    end

    it 'I can see a list of all the contestants' do
      expect(page).to have_content(@contestant_1.name)
      expect(page).to have_content(@contestant_1.age)
      expect(page).to have_content(@contestant_1.hometown)
      expect(page).to have_content(@contestant_1.years_of_experience)
      expect(page).to have_content(@contestant_2.name)
      expect(page).to have_content(@contestant_2.age)
      expect(page).to have_content(@contestant_2.hometown)
      expect(page).to have_content(@contestant_2.years_of_experience)
    end
  end
end
