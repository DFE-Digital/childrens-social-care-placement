FactoryBot.define do
  factory :placement_suitability do
    address_line_1 { "22"}
    address_line_2 { "Acacia ave" }
    address_city { "Manchester" }
    address_county { "greater Manchester" }
    address_postcode { "TR1 1UZ" }
    available { true }
    emergency { true }
    foster_parent
  end
end
