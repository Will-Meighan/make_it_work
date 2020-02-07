require 'rails_helper'


RSpec.describe Project, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :material}
  end

  describe "relationships" do
    it {should belong_to :challenge}
    it {should have_many :contestant_projects}
    it {should have_many(:contestants).through(:contestant_projects)}
  end

  it 'should count total number of contestants on a project' do
    challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    project = challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    contestant_1 = project.contestants.create(name: 'Will', age: 27, hometown: 'Ankeny', years_of_experience: 1)
    contestant_2 = project.contestants.create(name: 'Bobby', age: 13, hometown: 'Denver', years_of_experience: 13)

    expect(project.contestant_count).to eq(2)
  end

  it 'should calculate average years of experience' do
    challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)
    project = challenge.projects.create(name: "Upholstery Tuxedo", material: "Couch")
    contestant_1 = project.contestants.create(name: 'Will', age: 27, hometown: 'Ankeny', years_of_experience: 1)
    contestant_2 = project.contestants.create(name: 'Bobby', age: 13, hometown: 'Denver', years_of_experience: 13)

    expect(project.average_years_of_experience).to eq(7)
  end
end
