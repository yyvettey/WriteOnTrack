require 'rails_helper'

describe Task do
  before :each  do
    @task = Task.new( :title => "test0", 
    :create_date => "2018-10-29",
    :target_date =>"2022-05-01",
    :target_value => "100", 
    :desc => "test test", 
    :measure => "Page")
  end
  
  
  describe "the target date" do
    { 
      'earlier then create date' => "2017-05-01",
      'empty' => ''
    }.each do |problematic, target_date|
      it "cannot be #{problematic}" do
          @task.target_date = target_date
          @task.should_not be_valid
          @task.errors['target_date'].should be_any
      end
    end
  end
  
  
  describe "the target value" do
    { 
      'empty' => ''
    }.each do |problematic, target_value|
      it "cannot be #{problematic}" do
          @task.target_value = target_value
          @task.should_not be_valid
          @task.errors['target_value'].should be_any
      end
    end
  end
  
end