#
#  This file conatins the web steps to pass senarios for user stories
#
# #
Given("a user") do
  # @user = Factory(:user, :first_name => "Amith", :last_name => "Murakonda", :email => "amithmurakonda@gamil.com", :password => "$2a$10$WFVWNZhA2572N0.NLkTmveUyJfe1NrS3BFJ0fJmsN3FtjtD99F9sG", :confirm => true, :confirm_code => nil, :salt => "$2a$10$WFVWNZhA2572N0.NLkTmve")
  @user = FactoryGirl.create(:user)
end

Given("a task") do
  # @user = Factory(:user, :first_name => "Amith", :last_name => "Murakonda", :email => "amithmurakonda@gamil.com", :password => "$2a$10$WFVWNZhA2572N0.NLkTmveUyJfe1NrS3BFJ0fJmsN3FtjtD99F9sG", :confirm => true, :confirm_code => nil, :salt => "$2a$10$WFVWNZhA2572N0.NLkTmve")
  @task = FactoryGirl.create(:task)
end

Given("a task for the user:") do |task_table|
  @user = User.first
  task_table.hashes.each do |task|
    task[:target_date] = task[:target_date].to_time
    task[:create_date] = task[:create_date].to_time
    @task = @user.tasks.create!(task)
  end
end

When("I am on {string} users page") do |string|
  visit path_to(string)
end

And("I fill in {string} with {string}") do |string,string2|
  fill_in(string, :with => string2)
end

And("I press {string}") do |string|
  click_on(string)
end

And("I follow {string}") do |string|
  click_link(string)
end

Then("I should see {string} message") do |string|
  expect(page).to have_content(string)
end

Then("I should see {string}") do |string|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end


Then("I should be on {string} page") do |string|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(string)
  else
    assert_equal path_to(page_name), current_path
  end
end

Given("I am logged in as {string}") do |string|
    @user = User.find("email=",string)
end

Then("I should be redirected to {string} page") do |string|
  expect(page).to have_current_path(path_to(string))
end

When("I am on the dashboard") do
  visit '/users/login'
  @user = User.first
  fill_in("Email", :with => @user.email)
  fill_in("Password", :with => @user.password)
  click_on("Login")
  # visit '/users'
  # current_path = URI.parse(current_url).path
  # if current_path.respond_to? :should
  #   current_path.should == path_to("users")
  # else
  #   assert_equal path_to(page_name), current_path
  # end
end

Then("I should see all my tasks") do
  @user = User.first
    if page.respond_to? :should
      page.should have_no_content(@user.tasks.first.title)
    else
      assert page.has_no_content?(@user.tasks.first.title)
    end
end

Given("a task") do
  @user = FactoryGirl.create(:task)
end

When("I am on {string} page") do |string|
  visit path_to(string)
end

Then("I should see all the Progresses") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I back to the {string} page") do |string|
  visit path_to(string)
end

Then("I back to the dashboard") do
  visit '/users'
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to("users")
  else
    assert_equal path_to(page_name), current_path
  end
end

Then("I update progress to {string}") do |string|
  fill_in("progress", :with => string)
end
