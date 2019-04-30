Feature: Update existing tasks



Background: I logged in as "amithmurakonda@gmail.com"

    Given the following users exist:
    | First Name | Last Name | Email                    | Password  |
    | Amith      | Murakonda | amithmurakonda@gmail.com | amith1234 |

    Given a task for the user:
    | title  | create_date         | target_date         | target_value | desc                                | measure | current_value |
    | Task 1 | 2019-05-30 14:18:21 | 2019-06-30 00:00:00 | 100          | Complete my thesis by February 16th | Pages   | 1             |

    Scenario: update task
    When I am on "login" users page
    And I fill in "Email" with "amithmurakonda@gmail.com"
    And I fill in "Password" with "amith1234"
    And I press "Login"
    Then I should be redirected to "users" page

    And I press "Start Writing!"
    Then I should be on "Begin Progress Page" page
    Then I update "Update Progress" to "10"
    And I fill in "task_hour" with "0"
    And I fill in "task_min" with "0"
    And I fill in "task_sec" with "10"
    # Then I should see "Progress updated to '10% Pages Completed'"
