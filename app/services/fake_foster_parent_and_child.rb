class FakeFosterParentAndChild
  def initialize(number_foster_parents)
    @number = number_foster_parents
  end

  def call
    @number.times do
      foster_parent_and_child_hash = {
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        child_first_name: Faker::Name.first_name,
        child_last_name: Faker::Name.last_name,
      }
      yield foster_parent_and_child_hash
    end
  end
end
