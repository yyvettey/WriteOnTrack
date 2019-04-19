FactoryGirl.define do
    factory :user do |user|
        # user.email { FactoryGirl.next(:email) }
        # user.first_name { "First Name" }
        # user.last_name {"Last Name"}
        user.first_name "Amith"
        user.last_name "Murakonda"
        user.email "amithmurakonda@gmail.com"
        # user.password "$2a$10$WFVWNZhA2572N0.NLkTmveUyJfe1NrS3BFJ0fJmsN3FtjtD99F9sG"
        user.password "amith123"
        user.password_confirmation "amith123"
        user.confirm true
        user.confirm_code nil
        # user.salt "$2a$10$WFVWNZhA2572N0.NLkTmve"
    end
end

FactoryGirl.define do
    factory :task do |task|
        #
        #
    end
end
