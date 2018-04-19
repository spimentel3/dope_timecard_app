class Organization < ApplicationRecord
  belongs_to  :owner,     :class_name => 'User'
  has_many    :employees, :class_name => 'Employee'

  validates :name, presence: true
  validates :owner, presence: true

end
