class AddHostingFieldsToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :local, :boolean, :default => false
    add_column :videos, :remote, :boolean, :default => true
    add_column :videos, :host, :string
  end
end
