#
# This is data randomly generated using Faker gem to support testing in Alpha. Some of the data is
# fixed to aid testing and portion will be randomly re-generated every time the seed is re-run.
#
foster_parents = [
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
  foster_parents << {
    id: id,
    email: Faker::Internet.safe_email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
  }
end

children = [
  {
    id: 201,
    first_name: "Fredrick",
    last_name: "Gutmann",
  },
  {
    id: 202,
    first_name: "Yasmin",
    last_name: "Kub",
  },
]
(203..210).each do |id|
  children << {
    id: id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
  }
end

placements = [
  {
    id: 301,
    foster_parent_id: 102,
    child_id: 202,
  },
]

diary_entries = 10.times.map do |i|
  {
    placement_id: 301,
    note: Faker::Lorem.paragraph,
    created_at: i.days.ago,
    updated_at: i.days.ago,
  }
end

# data insertion for the above data
unless Rails.env.test?
  foster_parents.each do |fp|
    user = User.create!(
      email: fp[:email],
      password: "test1234",
    )
    FosterParent.create!(
      user: user,
      id: fp[:id],
      first_name: fp[:first_name],
      last_name: fp[:last_name],
    )
  end

  children.each do |ch|
    Child.create!(
      id: ch[:id],
      first_name: ch[:first_name],
      last_name: ch[:last_name],
    )
  end

  placements.each do |p|
    Placement.create!(
      id: p[:id],
      foster_parent_id: p[:foster_parent_id],
      child_id: p[:child_id],
    )
  end

  diary_entries.each do |dl|
    DiaryLog.create!(
      placement_id: dl[:placement_id],
      note: dl[:note],
      created_at: dl[:created_at],
      updated_at: dl[:updated_at],
    )
  end
end
