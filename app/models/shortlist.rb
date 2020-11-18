class Shortlist
  attr_reader :id, :child

  def initialize(child:)
    @child = child
    @id = child.id
  end
end
