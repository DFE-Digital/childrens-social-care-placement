class AnyBooleanValidator < ActiveModel::Validator
  def validate(record)
    unless options[:fields].any? { |attr| [true].include?(record.send(attr.to_sym)) }
      record.errors.add(:base, :options_blank || "Select an option from the list")
    end
  end
end
