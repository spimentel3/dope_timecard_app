class Comanager < ApplicationRecord
  belongs_to :user,           class_name: "User"
  belongs_to :organization,   class_name: "Organization"
end
