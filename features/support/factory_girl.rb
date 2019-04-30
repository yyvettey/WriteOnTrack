FactoryGirl.define do
    factory :user do |user|
        # user.email      { FactoryGirl.generate(:email) }
        user.email      { "Email@gmail.com" }
        user.first_name { "First Name" }
        user.last_name  { "Last Name" }
        user.password   { "Password" }
        # user.first_name "Amith"
        # user.last_name "Murakonda"
        # user.email "amithmurakonda@gmail.com"
        # user.password "$2a$10$WFVWNZhA2572N0.NLkTmveUyJfe1NrS3BFJ0fJmsN3FtjtD99F9sG"
        # user.password "amith123"
        # user.password_confirmation "amith123"
        # user.confirm true
        # user.confirm_code nil
        # user.salt "$2a$10$WFVWNZhA2572N0.NLkTmve"
    end
end

FactoryGirl.define do
    factory :task do |task|
        user
        task.title         { FactoryGirl.generate(:title) }
        task.create_date   { "Create Date" }
        task.target_date   { "Target Date" }
        task.target_value  { "Target Value" }
        task.desc          { "Desc" }
        task.measure       { "Measure" }
        task.current_value { "Current Value" }

        # task.create_date = task.create_date.to_time
        # task.target_date = task.target_date.to_time
        # task.target_value = task.target_value.to_i
        # task.current_value = task.current_value.to_i
        # task.title "Task 1"
        # task.create_date "2018-10-29 14:18:21"
        # task.target_date "2019-02-16 00:00:00"
        # task.target_value "100"
        # task.desc "Complete my thesis by February 16th"
        # task.measure "Page"
        # task.current_value "1"
    end
end
