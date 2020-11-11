require "rails_helper"

RSpec.describe CreateUsersAndChildren do
  let(:row) do
    {
      "first_name" => "Joe",
      "last_name" => "Bloggs",
      "email" => "joe@bloggs.com",
      "child_first_name" => "Tom",
      "child_last_name" => "Mulligan",
    }
  end
  subject { described_class.new(row) }

  describe "#initialize" do
    it "creates an instance of the class" do
      expect(subject).to be_an_instance_of(CreateUsersAndChildren)
    end

    it "sets the @row instance variable" do
      expect(subject.instance_variable_get("@row")).to eq(row)
    end
  end

  describe "#call" do
    it "creates a User, FosterParent and Child from valid data" do
      subject.call
      expect(User.count).to eq 1
      expect(User.first.email).to eq(row["email"])
      expect(FosterParent.count).to eq 1
      expect(FosterParent.first.first_name).to eq(row["first_name"])
      expect(FosterParent.first.last_name).to eq(row["last_name"])
      expect(Child.count).to eq 1
      expect(Child.first.first_name).to eq(row["child_first_name"])
      expect(Child.first.last_name).to eq(row["child_last_name"])
    end
  end
end
