class JobExperience < ApplicationRecord
  before_save :format_website

  def format_website
    if self.website.present?
      website = self.website.delete(' ').downcase
      if website.exclude?("//")
        website = self.website.prepend('http://')
      end
    end
  end
end
