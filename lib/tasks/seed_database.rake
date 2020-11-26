desc "seed the dev/production database with defined data"
task seed_database: :environment do
  SeedDatabase.new(SeedData.new).call
end
