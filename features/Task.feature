Feature: Test task

    As a logged in student
    So that I can add task
    I want to create a new task

Background: login page

    Given the following users exist:
    | First Name | Last Name | Email                    | Password  |
    | Amith      | Murakonda | amithmurakonda@gmail.com | amith1234 |

    Scenario: add task
        When I am on "login" users page
        And I fill in "Email" with "amithmurakonda@gmail.com"
        And I fill in "Password" with "amith1234"
        And I press "Login"

        Then I should be redirected to "users" page
        And I should see "Add a new task"
        And I press "Add a new task"
        Then I should be on "new task" page

        And I fill in "Project Name" with "test0"
        When I select "2022" and "May" and "1" as the "Deadline"
        And I fill in "Target" with "10"
        And I fill in "Description" with "test for test"
        And  I press "Create"
        Then I should be redirected to "Begin Progress Page" page
        And I should see "test0"

        Then I press "Cancel"
        Then I press "Back"
        Then I press "Back"
        Then I back to the dashboard
        And I should see "test0"
        And I should see "0% Completed"
        And I should see "Start Writing!"
        And I should see "View Progress"
        And I should see "View Task"
        And I should see "Delete Task"
