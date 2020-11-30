require "rails_helper"

RSpec.describe "seed_database", type: :task do
  it "calls the SeedDatabase service" do
    expect_any_instance_of(SeedDatabase).to receive(:call)
    task.invoke
  end
end
