desc "Generate a CSV file of fake foster parents and children"
task :generate_foster_parents_and_children, [:number_foster_parents] => :environment do |_t, args|
  # This may not work in docker running locally in production env
  raise "You can only run this in development" unless Rails.env.development?

  require "csv"
  headers = %i[first_name last_name email child_first_name child_last_name]
  options = { write_headers: true, headers: headers }

  CSV.open("fake_foster_parents.csv", "wb", **options) do |csv|
    FakeFosterParentAndChild.new(args[:number_foster_parents].to_i).call do |foster_parent|
      csv << foster_parent.values
    end
  end
end
