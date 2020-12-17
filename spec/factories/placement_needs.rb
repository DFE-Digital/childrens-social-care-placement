FactoryBot.define do
  factory :placement_need do
    child

    placement_date { Time.zone.today }
    postcode { "NR1 1BD" }
    location_radius_miles { 5 }
    criteria { "emergency" }
  end
end
