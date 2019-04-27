Feature: Test progress

    As a getted into a specific task
    So that I can view the progress
    I want to create a new progress
    
Background: I logged in as "amithmurakonda@gmail.com"

    Given the following users exist:
    | Amith | Murakonda | amithmurakonda@gmail.com || 1 | $2a$10$Mt.ehSw8N3N8eIs0MpmEI./rSuWAreOu9aLqFDWIYsRCp004/af7G | $2a$10$Mt.ehSw8N3N8eIs0MpmEI. |

    Given the following tasks:
    | Task 1 | 2018-10-29 14:18:21 |2019-02-16 00:00:00 | 100 || Complete my thesis by February 16th | Pages | 1 |
    
    Scenario: create progress
      When I am on the dashboard
      And I press "Task 1"
      Then I should be on "Task 1" page
      And I should see "View Progress History"
      And I press "View Progress History"
      Then I should be on "Progress History" page
      Then I should see all the Progresses
      And  I press "Create New Progress"
      And I fill in "Update Progress" with "100000"
      And I fill in "Hour" with "0"
      And I fill in "Minutes" with "0"
      And I fill in "Seconds" with "10"
      And  I press "Save Progress"
      Then I back to the "task" page
      And I should see "100% Completed"
      And I should see "View Progress History"
      And I should see "Create New Progress"
      And I should see "Back"
      
