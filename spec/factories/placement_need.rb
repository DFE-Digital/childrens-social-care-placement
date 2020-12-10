FactoryBot.define do
  factory :placement_need do
    child

    placement_date { Time.zone.today }
    postcode { "TR1 1UZ" }
    location_radius_miles { 5 }
    criteria { "emergency" }
  end
end
