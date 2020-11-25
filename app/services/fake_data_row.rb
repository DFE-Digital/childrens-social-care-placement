class FakeDataRow
  def initialize(number_foster_parents)
    @number = number_foster_parents
  end

  def call
    @number.times do
      yield foster_parent_and_child_hash
    end
  end

private

  def foster_parent_and_child_hash
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      child_first_name: Faker::Name.first_name,
      child_last_name: Faker::Name.last_name,
      child_date_of_birth: Faker::Date.birthday(min_age: 7, max_age: 15),
    }
  end
end
