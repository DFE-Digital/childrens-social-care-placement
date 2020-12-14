class PostcodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless PostcodeApi.new(value).postcode_valid?
      record.errors.add(attribute, :invalid)
    end
  end
end
