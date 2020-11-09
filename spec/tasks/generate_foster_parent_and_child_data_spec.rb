require "rails_helper"
require "csv"

RSpec.describe "generate_foster_parent_and_child_data", type: :task do
  csv_row = {
    "first_name" => "Joe",
    "last_name" => "Bloggs",
    "email" => "joe@bloggs.com",
    "child_first_name" => "Tom",
    "child_last_name" => "Mulligan",
  }
  headers = %i[first_name last_name email child_first_name child_last_name]
  options = { write_headers: true,
              headers: headers,
              encoding: "UTF-8" }

  before do
    CSV.open("fake_foster_parents.csv", "wb", **options) do |csv|
      csv << csv_row.values
    end
  end

  it "calls the FakeUsersAndChildData service" do
    expect_any_instance_of(FakeUsersAndChildData).to receive(:call)
    task.invoke
  end
end
