desc "Generate a CSV file of fake foster parents and children"
task :generate_foster_parents_and_children_csv, %i[number_foster_parents file_path] => :environment do |_t, args|
  require "csv"
  headers = %i[first_name last_name email child_first_name child_last_name]
  options = { write_headers: true, headers: headers }

  CSV.open(args[:file_path], "wb", **options) do |csv|
    FakeDataRow.new(args[:number_foster_parents].to_i).call do |foster_parent|
      csv << foster_parent.values
    end
  end
end
