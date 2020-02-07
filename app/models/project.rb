class Project <ApplicationRecord
  validates_presence_of :name, :material

  belongs_to :challenge

  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def contestant_count
    contestants.count
  end

  def average_years_of_experience
    total_years_of_experience = contestants.sum do |contestant|
      contestant.years_of_experience
    end
    total_years_of_experience / contestant_count
  end
end
