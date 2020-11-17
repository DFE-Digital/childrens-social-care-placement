class Shortlist
  attr_reader :id
  attr_reader :child

  def initialize(child:)
    @child = child
    @id = child.id
  end
end
