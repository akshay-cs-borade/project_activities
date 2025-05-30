class Activity < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :activity_type, inclusion: { in: ["comment", "status_change"] }
end
