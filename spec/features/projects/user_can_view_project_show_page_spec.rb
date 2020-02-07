require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the project show page' do

    before :each do
      @challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)

      @project = @challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

      @contestant_1 =  @project.contestants.create(name: 'Will', age: 27, hometown: 'Ankeny', years_of_experience: 1)
      @contestant_2 =  @project.contestants.create(name: 'Bobby', age: 13, hometown: 'Denver', years_of_experience: 13)

      visit "/projects/#{@project.id}"
    end

    it 'I can see the projects name and material' do
      expect(page).to have_content("Upholstery Tuxedo")
      expect(page).to have_content("Couch")
    end

    it 'I can see the theme of the challenge that the project belongs to' do
      expect(page).to have_content("Apartment Furnishings")
    end

    it 'I can see the number of contestants on this project' do
      expect(page).to have_content('Total number of contestants; 2')
    end

    it 'I can see the average years of experience for the contestants on this project' do
      expect(page).to have_content('Average years of experience; 7')
    end
  end
end
