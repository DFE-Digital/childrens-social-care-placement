FactoryBot.define do
  factory :placement_suitability do
    foster_parent

    respite { true }

    address_line_1 { "1 Street Name" }
    address_city { "Beautiful City" }
    address_county { "Lovely shire" }
    address_postcode { "LV1 3SH" }
  end
end
