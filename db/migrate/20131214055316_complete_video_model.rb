class CompleteVideoModel < ActiveRecord::Migration
   def change
    add_column :videos, :title, :string
    add_column :videos, :description, :text
    add_column :videos, :author, :string
    add_column :videos, :tags, :string
    add_column :videos, :duration, :integer
    add_column :videos, :deleted, :boolean, :default => false
  end
end
