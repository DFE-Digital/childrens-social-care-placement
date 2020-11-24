FactoryBot.define do
  factory :child do
    first_name { "Rosie" }
    last_name { "Child" }
    date_of_birth { Date.parse("2010-10-10") }
  end
end
