FactoryBot.define do
  factory :select_event do
    event_options { SelectEvent::EVENT_OPTIONS[:home_life] }
  end
end
