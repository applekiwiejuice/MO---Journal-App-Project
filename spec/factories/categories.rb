FactoryBot.define do
  factory :category do
    category_name {'This is a category name'}
    category_description {'This is a category description'}
    user_id { 1 }
    id { 1 }

    trait :with_a_longer_title do
      title { "This is a lonnnnnggggggeeeeeerrrr title" }
    end
  end
end