RSpec.shared_examples "sanitize postcodes" do |fields|
  fields.each do |field|
    it "sanitizes input on the #{field} field" do
      setter = "#{field}="
      subject.send(setter, "   input  ")
      subject.valid?
      expect(subject.send(field)).to eq("INPUT")
      subject.send(setter, "   ")
      subject.valid?
      expect(subject.send(field)).to be_nil
    end
  end
end
