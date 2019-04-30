Feature: Create new tasks and Editing the tasks



Background: I logged in as "amithmurakonda@gmail.com"


    Given the following users exist:
    | First Name | Last Name | Email                    | Password |
    | Amith      | Murakonda | amithmurakonda@gmail.com | amith123 |

    Scenario: create task
    Given a user
    When I am on "login" users page
    And I fill in "Email" with "amithmurakonda@gmail.com"
    And I fill in "Password" with "amith123"
    And I press "Login"
    Then I should be redirected to "users" page
    And I press "Add a new task"
    Then I should be on "new task" page
