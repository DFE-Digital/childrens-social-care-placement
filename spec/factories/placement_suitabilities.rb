FactoryBot.define do
  factory :placement_suitability do
    # address is relevant to placement_need postcode and radius
    address_line_1 { "1" }
    address_line_2 { "Prince of Wales Road" }
    address_city { "Norwich" }
    address_county { "Norfolk" }
    address_postcode { "NR1 1AR" }
    available { true }
    emergency { true }
    foster_parent

    trait :ten_miles_distant do
      address_line_1 { "1" }
      address_line_2 { "Church St" }
      address_city { "Bawburgh" }
      address_county { "Norwich" }
      address_postcode { "NR2 2TG" }
    end

    factory :distant_suitability, traits: [:ten_miles_distant]
  end
end
