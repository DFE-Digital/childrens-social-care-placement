desc "seed the dev/production database with defined data"
task seed_database: :environment do
  SeedDatabase.new.call
end
