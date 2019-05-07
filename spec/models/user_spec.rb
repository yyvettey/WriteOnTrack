require 'rails_helper'

describe User do
  before :each  do
    @user = User.new( :first_name => "Amith", 
    :last_name =>"Murakonda",
    :email => "random5@gmail.com", 
    :password => "amith123", 
    :password_confirmation => "amith123")
  end
  #end
  
  it "should be valid" do
    @user.should be_valid
  end
  
  describe "the email" do
  
    { 'empty' => '',
      'invalid email address' => "random5@gmail,com",
      'invalid email address1' => "random5.org"
    }.each do |problematic, email|
      it "cannot be #{problematic}" do
          @user.email = email
      end
    end
    
    it "should be unique" do
      duplicate_instructor = @user.dup
      duplicate_instructor.email = @user.email.upcase
      @user.save
    end
    
  end

  describe "the password" do
  
    it "should be present (nonblank)" do
      @user.password = @user.password_confirmation = " "
    end
  
    it "should have a minimum length" do
      @user.password = @user.password_confirmation = "a" 
      @user.should_not be_valid
    end
  
  end

end