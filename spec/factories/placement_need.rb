FactoryBot.define do
  factory :placement_need do
    placement_date { Time.zone.today }
    postcode { "TR1 1UZ" }
    child
  end
end
