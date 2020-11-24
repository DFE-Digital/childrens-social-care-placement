FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email.#{n}@test.digital.education.gov.uk" }
    password { "Pa$$word1" }
  end
end
