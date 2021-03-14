FactoryBot.define do
  factory :user do
    first_name { "first" } 
    last_name { "Last" } 
    email { "sample@example.com" }
    password { "password123456" }
    password_confirmation { "password123456" }
    id { "1" }
  end
end
