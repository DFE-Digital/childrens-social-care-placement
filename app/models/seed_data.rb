class SeedData
  attr_reader :foster_parents, :matchmakers, :children, :placements, :diary_entries
  TABLES = %w[users foster_parents matchmakers children placements diary_entries].freeze
  DUAL_SEEDS = [FosterParent, Matchmaker].freeze
  SINGLE_SEEDS = [Child, Placement, DiaryEntry].freeze

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
    (103..110).each do |id|
      @foster_parents << {
        id: id,
        email: Faker::Internet.safe_email,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
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
      },
      {
        id: 202,
        first_name: "Yasmin",
        last_name: "Kub",
        date_of_birth: "2011-11-11",
      },
    ]
    (203..210).each do |id|
      @children << {
        id: id,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        date_of_birth: Faker::Date.birthday(min_age: 7, max_age: 15),
      }
    end

    @placements = [
      {
        id: 301,
        foster_parent_id: 102,
        child_id: 202,
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
