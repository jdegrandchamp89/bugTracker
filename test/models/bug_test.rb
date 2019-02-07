require 'test_helper'

class BugTest < ActiveSupport::TestCase
  def setup
    @bug = Bug.create(title: "a bug", description: "This is the description of the bug, which says what is wrong.", issue_type: :issue, priority: :medium, status: :open, user_id: 1)
  end
 
  test "bug must be valid" do
    assert @bug.valid?
  end
  
  test "Title cannot be blank whenever a bug is created or edited" do
    @bug.title = ""
    assert_not @bug.valid?
  end
  
  test "Description cannot be blank whenever a bug is created or edited" do
    @bug.description = ""
    assert_not @bug.valid?
  end
  
  test "Issue_type must have valid values (you should represent these values as enumerated types.)" do
    valid_issue_types = [:issue, :enhancement, :feature]
    
    valid_issue_types.each do |is|
      begin
        @bug.issue_type = is
        assert true
      rescue
        assert false, "#{is} should be invalid"
      end
    end
  end
  
  test "Priority must have valid values (you should represent these values as enumerated types.)" do
    valid_priority = [:low, :medium, :high]
    
    valid_priority.each do |is|
      begin
        @bug.priority = is
        assert true
      rescue
        assert false, "#{is} should be invalid"
      end
    end
  end
  
  test "Status must have valid values (you should represent these values as enumerated types.)" do
    valid_status = [:open, :closed, :monitor]
    
    valid_status.each do |is|
      begin
        @bug.status = is
        assert true
      rescue
        assert false, "#{is} should be invalid"
      end
    end
  end
end
