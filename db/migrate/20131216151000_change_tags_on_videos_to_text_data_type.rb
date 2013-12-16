class ChangeTagsOnVideosToTextDataType < ActiveRecord::Migration
  def change
    change_column :videos, :tags, :text
  end
end
