require "rails_helper"
require "csv"

RSpec.describe "generate_foster_parent_and_child_data", type: :task do
  context "with vaild CSV row" do
    it "calls the FakeUsersAndChildData service" do
      expect_any_instance_of(CreateUsersAndChildren).to receive(:call)
      task.invoke("spec/fixtures/valid_data.csv")
      task.reenable
    end
  end

  context "with missing fields in row" do
    it "outputs a warning" do
      expect { task.invoke("spec/fixtures/missing_field.csv") }.to output("empty field at row 0\n").to_stdout
      task.reenable
    end
  end
end
