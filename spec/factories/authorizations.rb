FactoryBot.define do
  factory :authorization do
    user_id { 1 }
    provider { "MyString" }
    uid { "MyString" }
    token { "MyString" }
    secret { "MyString" }
    username { "MyString" }
  end
end
