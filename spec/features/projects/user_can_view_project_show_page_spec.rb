require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the project show page' do

    before :each do
      @challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      @project = @challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

      visit "/projects/#{@project.id}"
    end

    it 'I can see the projects name and material' do
      expect(page).to have_content("Upholstery Tuxedo")
      expect(page).to have_content("Couch")
    end

    it 'I can see the theme of the challenge that the project belongs to' do
      expect(page).to have_content("Apartment Furnishings")
    end
  end
end
