desc "Generate fake foster parent and child data"
task :generate_foster_parent_and_child_data, [:file_path] => :environment do |_t, args|
  csv_file = Rails.root.join(args[:file_path])
  raise "csv file needs to be generated..." unless File.exist? csv_file

  require "csv"
  options = { headers: true, encoding: "UTF-8" }

  CSV.foreach(csv_file, **options).with_index do |row, index|
    if row.field?(nil)
      puts "empty field at row #{index}"
      next
    end
    CreateUsersAndChildren.new(row).call
  end
end
