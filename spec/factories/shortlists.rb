FactoryBot.define do
  factory :shortlist do
    placement_need

    placement_types { placement_need.criteria }
  end
end
