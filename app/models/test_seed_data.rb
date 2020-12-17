class TestSeedData < SeedData
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
    @matchmakers = [
      {
        id: 401,
        email: "p.frog@example.com",
        first_name: "Paul",
        last_name: "Frog",
      },
    ]
    @placement_suitabilities = [
      {
        id: 101,
        foster_parent_id: 101,
        long_term: true,
        short_term: true,
        address_line_1: "1 Prince of Wales Road",
        address_city: "Norwich",
        address_county: "Norfolk",
        address_postcode: "NR1 1AR",
      },
      {
        id: 102,
        foster_parent_id: 102,
        long_term: true,
        short_term: true,
        emergency: true,
        address_line_1: "1 Church st",
        address_city: "Bawburgh",
        address_county: "Norwich",
        address_postcode: "NR2 2TG",
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
    ]
    @placements = [
      {
        id: 301,
        foster_parent_id: 101,
        placement_need_id: 501,
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
    @placement_needs = [
      {
        id: 501,
        child_id: 201,
        placement_date: 7.days.from_now,
        criteria: "long_term",
        postcode: "NR1 1BD",
        location_radius_miles: 5,
      },
    ]
    @shortlists = [
      {
        id: 501,
        placement_need_id: 501,
      },
    ]
  end
end
