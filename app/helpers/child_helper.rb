module ChildHelper
  def full_name(child_id)
    Child.find(child_id).full_name
  end
end
