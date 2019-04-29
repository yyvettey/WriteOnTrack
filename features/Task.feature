Feature: Test task

    As a logged in student
    So that I can add task
    I want to create a new task

Background: login page

    Scenario: add task
        Given a user
        When I am on "login" users page
        And I fill in "Email" with "amithmurakonda@gmail.com"
        And I fill in "Password" with "amith123"
        And I press "Login"

        And I should see "Add a new task"
        And I press "Add a new task"
        Then I should be on "new task" page
        And  I fill in "Title" with "test0"
        And I fill in "Target Value" with "10"
        And I fill in "Description" with "test for test"
        And  I press "Create"
        Then I should be redirected to "Begin Progress Page" page
        Then I press "Cancel"
        Then I press "Back"
        Then I press "Back"
        Then I back to the dashboard
        And I should see "test0"
        And I should see "0% Completed"
        And I should see "View Task"
        And I should see "Track Task"
        And I should see "Delete Task"
