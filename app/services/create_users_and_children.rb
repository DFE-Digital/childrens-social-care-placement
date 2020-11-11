class CreateUsersAndChildren
  def initialize(csv_row)
    @row = csv_row
  end

  def call
    user = User.create_or_find_by(
      email: @row["email"],
      password: "#{@row['last_name']}123456",
    )
    if user.persisted?
      foster_parent = FosterParent.create_or_find_by!(
        user_id: user.id,
        first_name: @row["first_name"],
        last_name: @row["last_name"],
      )
    end
    if foster_parent && foster_parent.persisted?
      foster_parent.children << Child.create_or_find_by!(
        first_name: @row["child_first_name"],
        last_name: @row["child_last_name"],
      )
    end
  end
end
