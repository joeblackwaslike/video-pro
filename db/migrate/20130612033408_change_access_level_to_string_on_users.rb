class ChangeAccessLevelToStringOnUsers < ActiveRecord::Migration
  def change
    change_column :users, :access_level, :string
  end
end
