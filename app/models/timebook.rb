class Timebook < ApplicationRecord
  belongs_to :timecard,         class_name: "Timecard"
  belongs_to :organization,     class_name: "Organization"
  belongs_to :user,             class_name: "User"
end
