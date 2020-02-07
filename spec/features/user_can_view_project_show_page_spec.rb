require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the project show page' do
    it 'I can see the projects name and material' do

      furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
      furniture_challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")

      visit "/projects/#{furniture_challenge.id}"

      expect(page).to have_content("Upholstery Tuxedo")
      expect(page).to have_content("Couch")
    end
  end
end
