Feature: Test progress

    As a getted into a specific task
    So that I can view the progress
    I want to create a new progress

Background: I logged in as "amithmurakonda@gmail.com"

    Given the following users exist:
    | First Name | Last Name | Email                    | Password  |
    | Amith      | Murakonda | amithmurakonda@gmail.com | amith1234 |

    Given a task for the user:
    | title  | create_date         | target_date         | target_value | desc                                | measure | current_value |
    | Task 1 | 2019-04-30 14:18:21 | 2019-06-30 00:00:00 | 100000       | Complete my thesis by February 16th | Pages   | 1             |

    Given timers for the task:
    | hours | minutes | seconds | progress | created_at              |
    | 1     | 1       | 1       | 10       | 2019-05-01 12:30:08 UTC |
    | 2     | 10      | 10      | 20       | 2019-05-02 12:30:08 UTC |
    | 3     | 40      | 50      | 100      | 2019-05-04 12:30:08 UTC |

    Scenario: create progress
        When I am on "login" users page
        And I fill in "Email" with "amithmurakonda@gmail.com"
        And I fill in "Password" with "amith1234"
        And I press "Login"
        Then I should be redirected to "users" page

        And I should see "View Task"
        And I should see "View Progress"
        And I should see "Delete Task"

        And I follow "View Progress"
        Then I should be on "Task" page

        And I should see "View Progress History"
        And I press "View Progress History"
        Then I should be on "Progress History" page
        And I should see all the Progresses

        Then I press "Create New Progress"
        And I refresh the page
        And I fill in "Update Progress" with "100000"
        And I fill in "task_hour" with "20"
        And I fill in "task_min" with "40"
        And I fill in "task_sec" with "10"
        And I press "Save Progress"

        Then I should be on "Task" page
        And I should see "Congratulations!"
        And I should see "100% Completed"
        And I should see "View Progress History"
        And I should see "Create New Progress"
        And I should see "Back"
