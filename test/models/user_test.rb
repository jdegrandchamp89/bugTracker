require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(lname: "DeGrandchamp", fname: "John", email: "jdegrandchamp89@gmail.com", thumbnail: "test_thumbnail_file.jpg")
  end
  
  test "lname cannot be blank" do
    @user.lname = ""
    assert_not @user.valid?
  end 
  
  test "fname cannot be blank" do
    @user.fname = ""
    assert_not @user.valid?
  end 
  
  test "email cannot be blank" do 
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "email must be unique" do
    attr = {lname: "DeGrandchamp", fname: "John", email: "jdegrandchamp89@gmail.com", thumbnail: "test_thumbnail_file.jpg"}
    assert user = User.new(attr)
    assert user.invalid?
    assert user.errors.include?(:email)
  end
  
  test "email must be a valid format for an email address" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?
    end
  end

  test "thumbnail must end with either .png, .jpg, or .gif" do
    valid_thumbnails = %w[thumbnail.png thumbnail.jpg thumbnail.gif]
    
    valid_thumbnails.each do |valid_thumbnail|
      @user.thumbnail = valid_thumbnail
      assert @user.valid?
    end
  end
end
