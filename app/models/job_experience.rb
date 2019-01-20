class JobExperience < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :collaborators
  has_many :users, through: :collaborators
  validates_presence_of :position, :company, :city, :state, :experience, :pay
  validates_format_of :website,
                      with: /[A-z]+[.]{1}[A-z]+/,
                      if: -> (je) { je.website.present? }

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

  US_STATES = [
    'AL',
    'AK',
    'AZ',
    'AR',
    'CA',
    'CO',
    'CT',
    'DE',
    'DC',
    'FL',
    'GA',
    'HI',
    'ID',
    'IL',
    'IN',
    'IA',
    'KS',
    'KY',
    'LA',
    'ME',
    'MD',
    'MA',
    'MI',
    'MN',
    'MS',
    'MO',
    'MT',
    'NE',
    'NV',
    'NH',
    'NJ',
    'NM',
    'NY',
    'NC',
    'ND',
    'OH',
    'OK',
    'OR',
    'PA',
    'PR',
    'RI',
    'SC',
    'SD',
    'TN',
    'TX',
    'UT',
    'VT',
    'VA',
    'WA',
    'WV',
    'WI',
    'WY'
  ]
end
