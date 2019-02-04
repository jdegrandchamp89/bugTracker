class Bug < ApplicationRecord
  belongs_to :user
  
  enum issue_type: [:issue, :enhancement, :feature]
  enum priority: [:low, :medium, :high]
  enum status: [:open, :closed, :monitor]
end
