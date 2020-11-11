require "rails_helper"

RSpec.describe "generate_foster_parents_and_children_csv", type: :task do
  it "calls the FakeFosterParentAndChild service" do
    expect_any_instance_of(FakeDataRow).to receive(:call)
    task.invoke(1, "test.csv")

    File.delete("test.csv") if File.exist?("test.csv")
  end
end
