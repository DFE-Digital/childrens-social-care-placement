require "rails_helper"

RSpec.describe NameIdentifiable do
  class TestModel
    include ActiveModel::Model
    include NameIdentifiable

    attr_accessor :first_name, :middle_name, :last_name
  end

  include_examples "name identifiable model" do
    let(:model_class) { TestModel }
  end
end
