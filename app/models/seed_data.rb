class SeedData
  attr_reader :foster_parents, :matchmakers, :children, :placements, :diary_entries, :placement_needs, :placement_suitabilities
  TABLES = %w[users foster_parents matchmakers children placements diary_entries placement_needs placement_suitabilities].freeze
  DUAL_SEEDS = [FosterParent, Matchmaker].freeze
  SINGLE_SEEDS = [Child, PlacementNeed, Placement, DiaryEntry, PlacementSuitability].freeze

  def initialize
    @foster_parents = [
      {
        id: 101,
        email: "r.johnston@example.com",
        first_name: "Rodger",
        last_name: "Johnston",
      },
      {
        id: 102,
        email: "lucy82@example.com",
        first_name: "Lucy",
        last_name: "Casper",
      },
    ]
    @placement_suitabilities = [
      {
        id: 101,
        foster_parent_id: 101,
        long_term: true,
        short_term: true,
        address_line_1: "49 Horns Ln",
        address_city: "Norwich",
        address_county: "Norfolk",
        address_postcode: "NR1 3ER",
      },
      {
        id: 102,
        foster_parent_id: 102,
        long_term: true,
        short_term: true,
        emergency: true,
        address_line_1: "102 Union St",
        address_city: "Norwich",
        address_county: "Norfolk",
        address_postcode: "NR2 2TG",
      },
    ]
    (103..110).each do |id|
      @foster_parents << {
        id: id,
        email: Faker::Internet.safe_email,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
      }
      @placement_suitabilities << {
        id: id,
        foster_parent_id: id,
        long_term: true,
        address_line_1: Faker::Address.street_address,
        address_city: "Norwich",
        address_county: "Norfolk",
        address_postcode: "NR#{id - 100} 1GA",
      }
    end

    @matchmakers = [
      {
        id: 401,
        email: "p.frog@example.com",
        first_name: "Paul",
        last_name: "Frog",
      },
    ]

    @children = [
      {
        id: 201,
        first_name: "Fredrick",
        last_name: "Gutmann",
        date_of_birth: "2010-10-10",
        gender: "male",
      },
      {
        id: 202,
        first_name: "Yasmin",
        last_name: "Kub",
        date_of_birth: "2011-11-11",
        gender: "female",
      },
      {
        id: 203,
        first_name: "Janay",
        last_name: "Wiegand",
        date_of_birth: "2010-12-23",
        gender: "male",
      },
    ]
    (204..210).each do |id|
      @children << {
        id: id,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        date_of_birth: Faker::Date.birthday(min_age: 7, max_age: 15),
        gender: %i[male female other].sample,
      }
    end

    @placement_needs = [
      {
        id: 202,
        child_id: 202,
        placement_date: 1.day.from_now,
        criteria: "long_term",
        postcode: "NR1 2BD",
        location_radius_miles: 10,
      },
      {
        id: 203,
        child_id: 203,
        placement_date: 7.days.from_now,
        criteria: "long_term",
        postcode: "NR1 1BD",
        location_radius_miles: 5,
      },
    ]

    @placements = [
      {
        id: 301,
        foster_parent_id: 102,
        placement_need_id: 202,
      },
    ]

    @diary_entries = 10.times.map do |i|
      {
        placement_id: 301,
        event: Faker::Lorem.word,
        note: Faker::Lorem.paragraphs(number: 2),
        created_at: i.days.ago,
        updated_at: i.days.ago,
      }
    end
  end
end
