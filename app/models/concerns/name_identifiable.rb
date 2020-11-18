module NameIdentifiable
  extend ActiveSupport::Concern

  included do
    validates :first_name, :last_name, presence: true
  end

  def full_name
    [first_name, middle_name, last_name].compact.join(" ")
  end
end
