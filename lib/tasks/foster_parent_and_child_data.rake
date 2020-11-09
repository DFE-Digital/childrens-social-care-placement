desc "Generate fake foster parent and child data"
task :generate_foster_parent_and_child_data, [:file_path] => :environment do |_t, args|
  csv_file = Rails.root.join(args[:file_path])
  raise "csv file needs to be generated..." unless File.exist? csv_file

  require "csv"
  options = { headers: true, encoding: "UTF-8" }
  # headers = %i[first_name last_name email child_first_name child_last_name]
  # could look at bulk insert for large datasets?

  CSV.foreach(csv_file, **options).with_index do |row, index|
    if row.field?(nil)
      puts "empty field at row #{index}"
      next
    end
    FakeUsersAndChildData.new(row).call
  end
end
