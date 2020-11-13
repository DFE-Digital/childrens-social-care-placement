FactoryBot.define do
  factory :matchmaker do
    user

    first_name { "Peter" }
    last_name { "Matchmaker" }
  end
end
