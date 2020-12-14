class SeedDatabase
  def initialize(seed_data)
    @seed_data = seed_data
  end

  def call
    truncate_tables
    ::SeedData::DUAL_SEEDS.each do |model|
      dual_seed(model, hash_name(model))
    end
    ::SeedData::SINGLE_SEEDS.each do |model|
      single_seed(model, hash_name(model))
    end
  end

private

  def truncate_tables
    ::SeedData::TABLES.each do |table|
      ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
    end
  end

  def hash_name(model)
    hash_name = "@seed_data." + model.name.pluralize.underscore
    instance_eval hash_name
  end

  def dual_seed(model, hash_array)
    hash_array.each do |hash|
      user = User.create!(
        email: hash[:email],
        password: "test1234",
      )
      model.create!(
        hash.merge({ user_id: user.id })
            .except(:email),
      )
    end
  end

  def single_seed(model, hash_array)
    hash_array.each do |hash|
      model.create hash
    end
  end
end
