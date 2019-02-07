class Bug < ApplicationRecord
  belongs_to :user
  
  enum issue_type: [:issue, :feature, :enhancement]
  enum priority: [:low, :medium, :high]
  enum status: [:closed, :open, :monitor]
  
  validates :title, presence: true
  validates :description, presence: true
end
