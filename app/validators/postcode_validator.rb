class PostcodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.nil?
      record.errors.add(attribute, :invalid)
      return
    end

    unless UKPostcode.parse(value).full_valid?
      record.errors.add(attribute, :invalid)
      return
    end

    unless PostcodeApi.new(value).postcode_valid?
      record.errors.add(attribute, :invalid)
    end
  end
end
