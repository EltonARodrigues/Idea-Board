class AddUsernameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column(:users, :username, :string, :limit => 25)
  end
end
