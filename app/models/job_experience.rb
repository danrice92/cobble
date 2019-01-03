class JobExperience < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :collaborators
  has_many :users, through: :collaborators

  before_save :format_website

  def format_website
    if self.website.present?
      website = self.website.delete(' ').downcase
      if website.exclude?("//")
        website = self.website.prepend('http://')
      end
    end
  end

  def collaborator_user_ids
    self.collaborators.pluck(:user_id)
  end
end
