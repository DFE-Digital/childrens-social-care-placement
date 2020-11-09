require "rails_helper"

RSpec.describe "generate_foster_parents_and_children_csv", type: :task do
  it "calls the FakeFosterParentAndChild service" do
    expect_any_instance_of(FakeFosterParentAndChild).to receive(:call)
    task.invoke(1)
  end
end